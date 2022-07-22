/*=============================================================================
	Fragmentshader for DrawGouraudPolygon, in 227 also DrawGouraudPolygonList.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

#if BINDLESSTEXTURES
layout(std140) uniform TextureHandles
{
	sampler2D Textures[NUMTEXTURES];
};
#endif

uniform sampler2D Texture0;	// Base Texture
uniform sampler2D Texture1;	// DetailTexture
uniform sampler2D Texture2;	// BumpMap
uniform sampler2D Texture3; // MacroTex

in vec3 gCoords;
in vec2 gTexCoords; // TexCoords
in vec2 gDetailTexCoords;
in vec2 gMacroTexCoords;
in vec4 gNormals;
in vec4 gEyeSpacePos;
in vec4 gLightColor;
in vec4 gFogColor; //VertexFog
flat in vec3 gTextureInfo; // diffuse, alpha, bumpmap specular
flat in uint gTexNum;
flat in uint gDetailTexNum;
flat in uint gBumpTexNum;
flat in uint gMacroTexNum;
flat in uint gDrawFlags;
flat in uint gTextureFormat;
flat in uint gPolyFlags;
flat in float gGamma;
flat in vec4 gDistanceFogColor;
flat in vec4 gDistanceFogInfo;
in vec3 gTangentViewPos;
in vec3 gTangentFragPos;
in mat3 gTBNMat;

#if EDITOR
flat in vec4 gDrawColor;
flat in uint gRendMap;
flat in uint gHitTesting;
#endif

#ifdef GL_ES
layout ( location = 0 ) out vec4 FragColor;
# if SIMULATEMULTIPASS
layout ( location = 1 ) out vec4 FragColor1;
#endif
#else
# if SIMULATEMULTIPASS
layout ( location = 0, index = 1) out vec4 FragColor1;
#endif
layout ( location = 0, index = 0) out vec4 FragColor;
#endif

vec3 rgb2hsv(vec3 c)
{
	// some nice stuff from http://lolengine.net/blog/2013/07/27/rgb-to-hsv-in-glsl
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = c.g < c.b ? vec4(c.bg, K.wz) : vec4(c.gb, K.xy);
    vec4 q = c.r < p.x ? vec4(p.xyw, c.r) : vec4(c.r, p.yzx);

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main(void)
{
    mat3 InFrameCoords = mat3(FrameCoords[1].xyz, FrameCoords[2].xyz, FrameCoords[3].xyz); // TransformPointBy...
    mat3 InFrameUncoords = mat3(FrameUncoords[1].xyz, FrameUncoords[2].xyz, FrameUncoords[3].xyz);

	vec4 TotalColor = vec4(0.0,0.0,0.0,0.0);
	vec4 Color;

	int NumLights = int(LightData4[0].y);

#if BINDLESSTEXTURES
	if (uint(gTexNum) > 0u)
       Color = texture(Textures[uint(gTexNum)], gTexCoords);
    else Color = texture(Texture0, gTexCoords);
#else
    Color = texture(Texture0, gTexCoords);
#endif

    #if SRGB
	if((gPolyFlags & PF_Modulated)!=PF_Modulated)
	{
		Color.r=max(1.055 * pow(Color.r, 0.416666667) - 0.055, 0.0);
		Color.g=max(1.055 * pow(Color.g, 0.416666667) - 0.055, 0.0);
        Color.b=max(1.055 * pow(Color.b, 0.416666667) - 0.055, 0.0);
    }
    #endif

    if (gTextureInfo.x > 0.0)
        Color *= gTextureInfo.x; // Diffuse factor.

    if (gTextureInfo.y > 0.0)
		Color.a *= gTextureInfo.y; // Alpha.

	if (gTextureFormat == TEXF_BC5) //BC5 (GL_COMPRESSED_RG_RGTC2) compression
        Color.b = sqrt(1.0 - Color.r*Color.r + Color.g*Color.g);

	// Handle PF_Masked.
	if ( (gPolyFlags&PF_Masked) == PF_Masked )
	{
		if(Color.a < 0.5)
			discard;
		else Color.rgb /= Color.a;
	}
	else if ( ((gPolyFlags&PF_AlphaBlend) == PF_AlphaBlend) && Color.a < 0.01 )
		discard;

	vec4 LightColor;

	#if HARDWARELIGHTS
		float LightAdd = 0.0f;
		vec4 TotalAdd = vec4(0.0,0.0,0.0,0.0);

		for (int i=0; i < NumLights; i++)
		{
			float WorldLightRadius = LightData4[i].x;
			float LightRadius = LightData2[i].w;
			float RWorldLightRadius = WorldLightRadius*WorldLightRadius;

			vec3 InLightPos = ((LightPos[i].xyz - FrameCoords[0].xyz)*InFrameCoords); // Frame->Coords.
			float dist = distance(gCoords, InLightPos);

			if (dist < RWorldLightRadius)
			{
				// Light color
				vec3 RGBColor = vec3(LightData1[i].x,LightData1[i].y,LightData1[i].z);

				float MinLight = 0.025;
				float b = WorldLightRadius / (RWorldLightRadius * MinLight);
				float attenuation = WorldLightRadius / (dist+b*dist*dist);

				//float attenuation = 0.82*(1.0-smoothstep(LightRadius,24.0*LightRadius+0.50,dist));

				TotalAdd += (vec4(RGBColor,1.0) * attenuation);
			}
		}
		LightColor = TotalAdd;
	#else
		LightColor = gLightColor;
	#endif

	// Handle PF_RenderFog.
	if ((gPolyFlags&PF_RenderFog) == PF_RenderFog)
	{
		// Handle PF_RenderFog|PF_Modulated.
		if ( (gPolyFlags&PF_Modulated)== PF_Modulated )
		{
			// Compute delta to modulation identity.
			vec3 Delta = vec3(0.5) - Color.xyz;

			// Reduce delta by (squared) fog intensity.
			//Delta *= 1.0 - sqrt(gFogColor.a);
			Delta *= 1.0 - gFogColor.a;
			Delta *= vec3(1.0) - gFogColor.rgb;

			TotalColor = vec4(vec3(0.5)-Delta,Color.a);
		}
		// Normal.
		else
		{
			Color*=LightColor;
			//TotalColor=mix(Color, vec4(gFogColor.xyz,1.0), gFogColor.w);
			TotalColor.rgb = Color.rgb * (1.0-gFogColor.a) + gFogColor.rgb;
			TotalColor.a   = Color.a;
		}

	}
	// No Fog.
	else if((gPolyFlags & PF_Modulated) == PF_Modulated)
	{
		TotalColor = Color;
	}
	else
	{
		TotalColor = Color * vec4(LightColor.rgb,1.0);
	}


#if DETAILTEXTURES
	if (((gDrawFlags & DF_DetailTexture) == DF_DetailTexture))
	{
        float NearZ = gCoords.z/512.0;
        float DetailScale = 1.0;
        float bNear;
	    vec4 DetailTexColor;
	    vec3 hsvDetailTex;

	    for(int i=0; i < DetailMax; ++i)
        {
            if (i > 0)
            {
                NearZ *= 4.223f;
                DetailScale *= 4.223f;
            }
            bNear = clamp(0.65-NearZ,0.0,1.0);

            if (bNear > 0.0)
            {
            # if BINDLESSTEXTURES
                if (gDetailTexNum > 0u)
                  DetailTexColor = texture(Textures[gDetailTexNum], gDetailTexCoords * DetailScale);
                else DetailTexColor = texture(Texture1, gDetailTexCoords * DetailScale);
            # else
                DetailTexColor = texture(Texture1, gDetailTexCoords * DetailScale);
            # endif

                vec3 hsvDetailTex = rgb2hsv(DetailTexColor.rgb); // cool idea Han :)
                hsvDetailTex.b += (DetailTexColor.r - 0.1);
                hsvDetailTex = hsv2rgb(hsvDetailTex);
                DetailTexColor = vec4(hsvDetailTex,0.0);
                DetailTexColor = mix(vec4(1.0,1.0,1.0,1.0), DetailTexColor, bNear); //fading out.

                TotalColor.rgb*=DetailTexColor.rgb;
            }
        }
	}
#endif


#if MACROTEXTURES
	if ((gDrawFlags & DF_MacroTexture) == DF_MacroTexture && (gDrawFlags & DF_BumpMap) != DF_BumpMap)
	{
		vec4 MacroTexColor;
		#if BINDLESSTEXTURES
		if (gMacroTexNum > 0u)
			MacroTexColor = texture(Textures[gMacroTexNum], gMacroTexCoords);
		else
			MacroTexColor = texture(Texture3, gMacroTexCoords); // MacroTexture
		#else
		MacroTexColor = texture(Texture3, gMacroTexCoords); // MacroTexture
		#endif
		vec3 hsvMacroTex = rgb2hsv(MacroTexColor.rgb);
		hsvMacroTex.b += (MacroTexColor.r - 0.1);
		hsvMacroTex = hsv2rgb(hsvMacroTex);
		MacroTexColor=vec4(hsvMacroTex,1.0);
		TotalColor*=MacroTexColor;
	}
#endif

	// BumpMap
#if BUMPMAPS
	if ((gDrawFlags & DF_BumpMap) == DF_BumpMap)
	{
	    vec3 TangentViewDir  = normalize( gTangentViewPos - gTangentFragPos );

		//normal from normal map
		vec3 TextureNormal;
#if BINDLESSTEXTURES
        if (gBumpTexNum > uint(0))
            TextureNormal = texture(Textures[gBumpTexNum], gTexCoords).rgb * 2.0 - 1.0;
        else
            TextureNormal = texture(Texture2, gTexCoords).rgb * 2.0 - 1.0;
#else
            TextureNormal = texture(Texture2, gTexCoords).rgb * 2.0 - 1.0;
#endif

		vec3 BumpColor;
		vec3 TotalBumpColor=vec3(0.0,0.0,0.0);

		for(int i=0; i<NumLights; ++i)
		{
		    vec3 CurrentLightColor = vec3(LightData1[i].x,LightData1[i].y,LightData1[i].z);

			float NormalLightRadius = LightData5[i].x;
            bool bZoneNormalLight = bool(LightData5[i].y);
            float LightBrightness = LightData5[i].z/255.0;

            if (NormalLightRadius == 0.0)
                NormalLightRadius = LightData2[i].w * 64.0;

			bool bSunlight = (uint(LightData2[i].x) == LE_Sunlight);
			vec3 InLightPos = ((LightPos[i].xyz - FrameCoords[0].xyz)*InFrameCoords); // Frame->Coords.

			float dist = distance(gCoords, InLightPos);

            float MinLight = 0.05;
            float b = NormalLightRadius / (NormalLightRadius * NormalLightRadius * MinLight);
            float attenuation = NormalLightRadius / (dist+b*dist*dist);

			if ( (gPolyFlags&PF_Unlit) == PF_Unlit)
				InLightPos=vec3(1.0,1.0,1.0); //no idea whats best here. Arbitrary value based on some tests.

			if ( (NormalLightRadius == 0.0 || (dist > NormalLightRadius) || ( bZoneNormalLight && (LightData4[i].z != LightData4[i].w))) && !bSunlight)// Do not consider if not in range or in a different zone.
				continue;

			vec3 TangentLightPos = gTBNMat * InLightPos;
            vec3 TangentlightDir = normalize( TangentLightPos - gTangentFragPos );

            // ambient
            vec3 ambient = 0.1 * TotalColor.xyz;

            // diffuse
            float diff = max(dot(TangentlightDir, TextureNormal), 0.0);
            vec3 diffuse = diff * TotalColor.xyz;

            // specular
            vec3 halfwayDir = normalize(TangentlightDir + TangentViewDir);
            float spec = pow(max(dot(TextureNormal, halfwayDir), 0.0), 8.0);
            vec3 specular = vec3(0.01) * spec * CurrentLightColor * LightBrightness;

            TotalBumpColor += (ambient + diffuse + specular) * attenuation;

		}
		TotalColor+=vec4(clamp(TotalBumpColor,0.0,1.0),1.0);
	}
#endif


	// Add DistanceFog
#if ENGINE_VERSION==227
	if (gDistanceFogInfo.w >= 0.0)
	{
	    FogParameters DistanceFogParams;
        DistanceFogParams.FogStart = gDistanceFogInfo.x;
        DistanceFogParams.FogEnd = gDistanceFogInfo.y;
        DistanceFogParams.FogDensity = gDistanceFogInfo.z;
        DistanceFogParams.FogMode = int(gDistanceFogInfo.w);

		if ( (gPolyFlags&PF_Modulated) == PF_Modulated )
			DistanceFogParams.FogColor = vec4(0.5,0.5,0.5,0.0);
		else if ( (gPolyFlags&PF_Translucent) == PF_Translucent && (gPolyFlags&PF_Environment) != PF_Environment)
			DistanceFogParams.FogColor = vec4(0.0,0.0,0.0,0.0);
        else DistanceFogParams.FogColor = gDistanceFogColor;

		DistanceFogParams.FogCoord = abs(gEyeSpacePos.z/gEyeSpacePos.w);
		TotalColor = mix(TotalColor, DistanceFogParams.FogColor, getFogFactor(DistanceFogParams));
	}
#endif

	if((gPolyFlags & PF_Modulated)!=PF_Modulated)
	{
#if EDITOR
        // Gamma
        float InGamma = gGamma*GammaMultiplierUED;
        TotalColor.r=pow(TotalColor.r,1.0/InGamma);
        TotalColor.g=pow(TotalColor.g,1.0/InGamma);
        TotalColor.b=pow(TotalColor.b,1.0/InGamma);
#else
		// Gamma
		float InGamma = gGamma*GammaMultiplier; // gGamma is a value from 0.1 to 1.0
        TotalColor.r=pow(TotalColor.r,1.0/InGamma);
        TotalColor.g=pow(TotalColor.g,1.0/InGamma);
        TotalColor.b=pow(TotalColor.b,1.0/InGamma);
#endif
	}

#if EDITOR
	// Editor support.
	if (gRendMap == REN_Zones || gRendMap == REN_PolyCuts || gRendMap == REN_Polys || gRendMap==REN_PlainTex)
	{
		TotalColor = Color;

		if ( (gPolyFlags&PF_Selected) == PF_Selected )
        {
            TotalColor.r = (TotalColor.r*0.75);
            TotalColor.g = (TotalColor.g*0.75);
            TotalColor.b = (TotalColor.b*0.75) + 0.1;
            TotalColor = clamp(TotalColor,0.0,1.0);
            if(TotalColor.a < 0.5)
                TotalColor.a = 0.51;
        }
	}
	else if ( gRendMap==REN_Normals )
	{
		// Dot.
		float T = 0.5*dot(normalize(gCoords),gNormals.xyz);

		// Selected.
		if ( (gPolyFlags&PF_Selected)==PF_Selected )
		{
			TotalColor = vec4(0.0,0.0,abs(T),1.0);
		}
		// Normal.
		else
		{
			TotalColor = vec4(max(0.0,T),max(0.0,-T),0.0,1.0);
		}
	}

    // HitSelection, Zoneview etc.
	if (bool(gHitTesting))
		TotalColor = gDrawColor; // Use DrawColor.

	// Texture.Alpha support.
	if ( (gPolyFlags&PF_AlphaBlend) == PF_AlphaBlend && gDrawColor.a > 0.0 )
		TotalColor.a *= gDrawColor.a;
#endif

# if SIMULATEMULTIPASS
    if((gPolyFlags & PF_Modulated) == PF_Modulated)
    {
        FragColor	= TotalColor;
        FragColor1	= (vec4(1.0,1.0,1.0,1.0)-TotalColor);
	}
	else
    {
        FragColor	= TotalColor;
        FragColor1	= (vec4(1.0,1.0,1.0,1.0)-TotalColor)*LightColor;
	}
#else
    FragColor	= TotalColor;
#endif

}

// Blending translation table
/*
//PF_Modulated
//glBlendFunc( GL_DST_COLOR, GL_SRC_COLOR );
//pixel_color * gl_FragColor

GL_ONE 						vec4(1.0)
GL_ZERO 					vec4(0.0)
GL_SRC_COLOR 				gl_FragColor
GL_SRC_ALPHA 				vec4(gl_FragColor.a)
GL_DST_COLOR 				pixel_color
GL_DST_ALPHA 				vec4(pixel_color.a)
GL_ONE_MINUS_SRC_COLOR		vec4(1.0) - gl_FragColor
GL_ONE_MINUS_SRC_ALPHA 		vec4(1.0  - gl_FragColor.a)
GL_ONE_MINUS_DST_COLOR 		vec4(1.0) - pixel_color
GL_ONE_MINUS_DST_ALPHA 		vec4(1.0  - pixel_color.a)

if (gPolyFlags & PF_Invisible)
	glBlendFunc(GL_ZERO, GL_ONE);

if (gPolyFlags & PF_Translucent)
	glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_COLOR);

if (gPolyFlags & PF_Modulated)
	glBlendFunc(GL_DST_COLOR, GL_SRC_COLOR);

if (gPolyFlags & PF_AlphaBlend)
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

if (gPolyFlags & PF_Highlighted)
	glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
*/
