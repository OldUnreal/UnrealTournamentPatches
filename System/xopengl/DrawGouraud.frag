/*=============================================================================
	Fragmentshader for DrawGouraudPolygon, in 227 also DrawGouraudPolygonList.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

uniform sampler2D Texture0;	// Base Texture
uniform sampler2D Texture1;	// DetailTexture
uniform sampler2D Texture2;	// BumpMap
uniform sampler2D Texture3; // MacroTex

uniform vec4 DrawColor;
uniform uint PolyFlags;
uniform uint RendMap;
uniform bool bHitTesting;
uniform float Gamma;
uniform bool DrawGouraudFog;//VertexFog

in vec4 gTexUV; // + MacrotexUV
in vec2 gDetailTexUV;
in vec3 gCoords;
in vec2 gTexCoords; // TexCoords
in vec4 gNormals;
in vec4 gEyeSpacePos;
in vec4 gLightColor;
in vec4 gFogColor; //VertexFog
in vec4 gLightSpacePos;
in vec4 gTextureInfo; //Additional texture info: TextureDiffuse, BumpTextureSpecular, bMacroTex, MacroTexNum
flat in uint gTexNum;
flat in uint gDetailTexNum;
flat in uint gBumpTexNum;
flat in uint gDrawFlags;
flat in uint gTextureFormat;
in mat3 TBNMat;

out vec4 FragColor;

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
	vec4 TotalColor = vec4(0.0,0.0,0.0,0.0);
	vec4 Color;

	vec2 texCoords = gTexCoords;

	int NumLights = int(LightData4[0].y);
	mat3 InFrameCoords = mat3(FrameCoords[1].xyz, FrameCoords[2].xyz, FrameCoords[3].xyz); // TransformPointBy...
	mat3 InFrameUncoords =  mat3(FrameUncoords[1].xyz, FrameUncoords[2].xyz, FrameUncoords[3].xyz);

    #ifdef BINDLESSTEXTURES
    if (gTexNum > 0u)
        Color = texture(Textures[uint(gTexNum)], (texCoords*gTexUV.xy));
    else Color = texture(Texture0, (texCoords*gTexUV.xy));
    #else
    Color = texture(Texture0, (texCoords*gTexUV.xy));
    #endif

	Color *= gTextureInfo.x; // Diffuse factor.

    if (gTextureInfo.z > 0.0)
		Color.a *= gTextureInfo.z; // Alpha.

	if (gTextureFormat == TEXF_RGTC_RG) //BC5 (GL_COMPRESSED_RG_RGTC2) compression
        Color.b = sqrt(1.0 - Color.r*Color.r + Color.g*Color.g);

	// Handle PF_Masked.
	if ( (PolyFlags&PF_Masked) == PF_Masked )
	{
		if(Color.a < 0.5)
			discard;
		else Color.rgb /= Color.a;
	}
	else if ( ((PolyFlags&PF_AlphaBlend) == PF_AlphaBlend) && Color.a < 0.01 )
		discard;

	vec4 LightColor;

	#ifdef HARDWARELIGHTS
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
	if ((PolyFlags&PF_RenderFog) == PF_RenderFog)
	{
		// Handle PF_RenderFog|PF_Modulated.
		if ( (PolyFlags&PF_Modulated)== PF_Modulated )
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
	else if((PolyFlags & PF_Modulated) == PF_Modulated)
	{
		TotalColor = Color;
	}
	else
	{
		TotalColor = Color * vec4(LightColor.rgb,1.0);
	}


	float bNear = clamp(1.0-(gCoords.z/380.0),0.0,1.0);
	if( ((gDrawFlags & DF_DetailTexture) == DF_DetailTexture) && bNear > 0.0)
	{
	    vec4 DetailTexColor;
	    #ifdef BINDLESSTEXTURES
	    if (gDetailTexNum > 0u)
            DetailTexColor = texture(Textures[gDetailTexNum], (gTexCoords*gDetailTexUV));
        else
            DetailTexColor = texture(Texture1, (gTexCoords*gDetailTexUV)); // DetailTexture
        #else
        DetailTexColor = texture(Texture1, (gTexCoords*gDetailTexUV)); // DetailTexture
        #endif
		vec3 hsvDetailTex = rgb2hsv(DetailTexColor.rgb);
		hsvDetailTex.b += (DetailTexColor.r - 0.1);
		hsvDetailTex = hsv2rgb(hsvDetailTex);
		DetailTexColor=vec4(hsvDetailTex,0.0);
		DetailTexColor = mix(vec4(1.0,1.0,1.0,1.0), DetailTexColor, bNear); //fading out.
		TotalColor*=DetailTexColor;
	}

	if ((gDrawFlags & DF_MacroTexture) == DF_MacroTexture)
	{
		vec4 MacroTexColor;
		#ifdef BINDLESSTEXTURES
		if (gDetailTexNum > 0u)
			MacroTexColor = texture(Textures[uint(gTextureInfo.w)], (gTexCoords*gTexUV.zw));
		else
			MacroTexColor = texture(Texture3, (gTexCoords*gTexUV.zw)); // MacroTexture
		#else
		MacroTexColor = texture(Texture3, (gTexCoords*gTexUV.zw)); // MacroTexture
		#endif
		vec3 hsvMacroTex = rgb2hsv(MacroTexColor.rgb);
		hsvMacroTex.b += (MacroTexColor.r - 0.1);
		hsvMacroTex = hsv2rgb(hsvMacroTex);
		MacroTexColor=vec4(hsvMacroTex,1.0);
		TotalColor*=MacroTexColor;
	}

	// BumpMap
	if ((gDrawFlags & DF_BumpMap) == DF_BumpMap)
	{
		//normal from normal map
        vec3 TextureNormal;
		vec3 TextureNormal_tangentspace;

        #ifdef BINDLESSTEXTURES
             if (gBumpTexNum > uint(0))
                TextureNormal = texture(Textures[gBumpTexNum], gTexCoords*gTexUV.xy).rgb * 2.0 - 1.0;
            else
                TextureNormal = texture(Texture2, gTexCoords*gTexUV.xy).rgb * 2.0 - 1.0;
        #else
            TextureNormal = texture(Texture2, gTexCoords*gTexUV.xy).rgb * 2.0 - 1.0;
		#endif

        TextureNormal.b = sqrt(1.0 - TextureNormal.r*TextureNormal.r + TextureNormal.g*TextureNormal.g);

        TextureNormal_tangentspace = TextureNormal;

		vec3 BumpColor;
		vec3 TotalBumpColor=vec3(0.0,0.0,0.0);
		vec3 EyeDirection_tangentspace = TBNMat * gEyeSpacePos.xyz;

		for(int i=0; i<NumLights; ++i)
		{
			float NormalLightRadius = LightData5[i].x;
            bool bZoneNormalLight = bool(LightData5[i].y);
			float LightRadius = LightData2[i].w;
			bool bSunlight = (uint(LightData2[i].x) == LE_Sunlight);
			vec3 InLightPos = ((LightPos[i].xyz - FrameCoords[0].xyz)*InFrameCoords); // Frame->Coords.
			float dist = distance(gCoords, InLightPos);

            float MinLight = 0.05;
            float b = NormalLightRadius / (NormalLightRadius * NormalLightRadius * MinLight);
            float attenuation = NormalLightRadius / (dist+b*dist*dist);

			if ( (PolyFlags&PF_Unlit) == PF_Unlit)
				InLightPos=vec3(1.0,1.0,1.0); //no idea whats best here. Arbitrary value based on some tests.

			if ( (NormalLightRadius == 0.0 || (dist > NormalLightRadius) || ( bZoneNormalLight && (LightData4[i].z != LightData4[i].w))) && !bSunlight)// Do not consider if not in range or in a different zone.
				continue;

			vec3 LightPosition_cameraspace = ( viewMat * vec4(InLightPos,1)).xyz;
			vec3 LightDirection_cameraspace = gEyeSpacePos.xyz - LightPosition_cameraspace;
			vec3 LightDirection_tangentspace = TBNMat * LightDirection_cameraspace;

			vec3 LightDir = normalize(LightDirection_tangentspace);
			// Cosine of the angle between the normal and the light direction,
			// clamped above 0
			//  - light is at the vertical of the triangle -> 1
			//  - light is perpendicular to the triangle -> 0
			//  - light is behind the triangle -> 0
			float cosTheta = clamp( dot( TextureNormal_tangentspace, LightDir ), 0.0,1.0 );

			vec3 E = normalize(EyeDirection_tangentspace);
			// Direction in which the triangle reflects the light
			vec3 R = reflect(-LightDir,TextureNormal_tangentspace);
			// Cosine of the angle between the Eye vector and the Reflect vector,
			// clamped to 0
			//  - Looking into the reflection -> 1
			//  - Looking elsewhere -> < 1
			float cosAlpha = clamp( dot( E,R ), 0.0,1.0 );

			vec3 LightColor = vec3(LightData1[i].x,LightData1[i].y,LightData1[i].z);
			vec3 MaterialAmbientColor = vec3(0.1,0.1,0.1) * Color.xyz;

			if (gTextureInfo.y > 0.0) // Specular
				TotalBumpColor +=  (MaterialAmbientColor + Color.xyz * LightColor * cosTheta * pow(cosAlpha,gTextureInfo.y)) * attenuation;
			else
				TotalBumpColor +=  (MaterialAmbientColor + Color.xyz * LightColor * cosTheta) * attenuation;

		}
		if (TotalBumpColor.x != 0.0 || TotalBumpColor.y != 0.0 || TotalBumpColor.z != 0.0) //no light close enough.
			TotalColor*=vec4(clamp(TotalBumpColor,0.0,1.0),1.0);
	}


	// Add DistanceFog
	if (DistanceFogValues.w >= 0.0)
	{
	    FogParameters DistanceFogParams;
        DistanceFogParams.FogStart = DistanceFogValues.x;
        DistanceFogParams.FogEnd = DistanceFogValues.y;
        DistanceFogParams.FogDensity = DistanceFogValues.z;
        DistanceFogParams.FogMode = int(DistanceFogValues.w);

		if ( (PolyFlags&PF_Modulated) == PF_Modulated )
			DistanceFogParams.FogColor = vec4(0.5,0.5,0.5,0.0);
		else if ( (PolyFlags&PF_Translucent) == PF_Translucent && (PolyFlags&PF_Environment) != PF_Environment)
			DistanceFogParams.FogColor = vec4(0.0,0.0,0.0,0.0);
        else DistanceFogParams.FogColor = DistanceFogColor;

		DistanceFogParams.FogCoord = abs(gEyeSpacePos.z/gEyeSpacePos.w);
		TotalColor = mix(TotalColor, DistanceFogParams.FogColor, getFogFactor(DistanceFogParams));
	}

	if((PolyFlags & PF_Modulated)!=PF_Modulated)
	{
		// Gamma
#ifdef GL_ES
		// 1.055*pow(x,(1.0 / 2.4) ) - 0.055
		// FixMe: ugly rough srgb to linear conversion.
		TotalColor.r=(1.055*pow(TotalColor.r,(1.0-Gamma / 2.4))-0.055);
		TotalColor.g=(1.055*pow(TotalColor.g,(1.0-Gamma / 2.4))-0.055);
		TotalColor.b=(1.055*pow(TotalColor.b,(1.0-Gamma / 2.4))-0.055);
#else
		TotalColor.r=pow(TotalColor.r,2.7-Gamma*1.7);
		TotalColor.g=pow(TotalColor.g,2.7-Gamma*1.7);
		TotalColor.b=pow(TotalColor.b,2.7-Gamma*1.7);
#endif
	}

#ifdef EDITOR
	// Editor support.
	if (RendMap == REN_Zones || RendMap == REN_PolyCuts || RendMap == REN_Polys || RendMap==REN_PlainTex)
	{
		TotalColor = Color;

		if ( (PolyFlags&PF_Selected) == PF_Selected )
        {
            TotalColor.r = (TotalColor.r*0.75);
            TotalColor.g = (TotalColor.g*0.75);
            TotalColor.b = (TotalColor.b*0.75) + 0.1;
            TotalColor = clamp(TotalColor,0.0,1.0);
            if(TotalColor.a < 0.5)
                TotalColor.a = 0.51;
        }
	}
	else if ( RendMap==REN_Normals )
	{
		// Dot.
		float T = 0.5*dot(normalize(gCoords),gNormals.xyz);

		// Selected.
		if ( (PolyFlags&PF_Selected)==PF_Selected )
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
	if (bHitTesting)
		TotalColor = DrawColor; // Use DrawColor.
#endif

	// Texture.Alpha support.
	if ( (PolyFlags&PF_AlphaBlend) == PF_AlphaBlend && DrawColor.a > 0.0 )
		TotalColor.a *= DrawColor.a;

	FragColor = TotalColor;
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

if (PolyFlags & PF_Invisible)
	glBlendFunc(GL_ZERO, GL_ONE);

if (PolyFlags & PF_Translucent)
	glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_COLOR);

if (PolyFlags & PF_Modulated)
	glBlendFunc(GL_DST_COLOR, GL_SRC_COLOR);

if (PolyFlags & PF_AlphaBlend)
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

if (PolyFlags & PF_Highlighted)
	glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
*/
