/*=============================================================================
	Fragmentshader for DrawComplexSurface, single pass.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

// DrawComplex TexCoords Indices
const uint  IDX_DIFFUSE_COORDS     = 0u;
const uint  IDX_LIGHTMAP_COORDS    = 1u;
const uint  IDX_FOGMAP_COORDS      = 2u;
const uint  IDX_DETAIL_COORDS      = 3u;
const uint  IDX_MACRO_COORDS       = 4u;
const uint  IDX_ENVIROMAP_COORDS   = 5u;
const uint  IDX_DIFFUSE_INFO       = 6u;
const uint  IDX_MACRO_INFO         = 7u;
const uint  IDX_BUMPMAP_INFO       = 8u;
const uint  IDX_HEIGHTMAP_INFO     = 9u;
const uint  IDX_X_AXIS             = 10u;
const uint  IDX_Y_AXIS             = 11u;
const uint  IDX_Z_AXIS             = 12u;
const uint  IDX_DRAWCOLOR          = 13u;
const uint  IDX_DISTANCE_FOG_COLOR = 14u;
const uint  IDX_DISTANCE_FOG_INFO  = 15u;

uniform sampler2D Texture0;	//Base Texture
uniform sampler2D Texture1;	//Lightmap
uniform sampler2D Texture2;	//Fogmap
uniform sampler2D Texture3;	//Detail Texture
uniform sampler2D Texture4;	//Macro Texture
uniform sampler2D Texture5;	//BumpMap
uniform sampler2D Texture6;	//EnvironmentMap
uniform sampler2D Texture7;	//HeightMap

in vec3 vCoords;
#if EDITOR
flat in vec3 vSurfaceNormal;
#endif
#if ENGINE_VERSION==227 || BUMPMAPS
in vec4 vEyeSpacePos;
flat in mat3 vTBNMat;
#endif

in vec2 vTexCoords;
in vec2 vLightMapCoords;
in vec2 vFogMapCoords;
in vec3 vTangentViewPos;
in vec3 vTangentFragPos;

#if DETAILTEXTURES
in vec2 vDetailTexCoords;
#endif
#if MACROTEXTURES
in vec2 vMacroTexCoords;
#endif
#if BUMPMAPS
in vec2 vBumpTexCoords;
#endif
#if ENGINE_VERSION==227
in vec2 vEnvironmentTexCoords;
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

#if SHADERDRAWPARAMETERS
flat in uint vTexNum;
flat in uint vLightMapTexNum;
flat in uint vFogMapTexNum;
flat in uint vDetailTexNum;
flat in uint vMacroTexNum;
flat in uint vBumpMapTexNum;
flat in uint vEnviroMapTexNum;
flat in uint vHeightMapTexNum;
flat in uint vDrawFlags;
flat in uint vTextureFormat;
flat in uint vPolyFlags;
flat in float vBaseDiffuse;
flat in float vBaseAlpha;
flat in float vParallaxScale;
flat in float vGamma;
flat in float vBumpMapSpecular;
# if EDITOR
flat in uint vHitTesting;
flat in uint vRendMap;
flat in vec4 vDrawColor;
# endif
flat in vec4 vDistanceFogColor;
flat in vec4 vDistanceFogInfo;
#else
float vBumpMapSpecular;
uniform vec4 TexCoords[16];
uniform uint TexNum[16];
uniform uint DrawFlags[4];
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

#if ENGINE_VERSION==227
vec2 ParallaxMapping(vec2 ptexCoords, vec3 viewDir, uint TexNum, out float parallaxHeight)
{

#if BASIC_PARALLAX

// very basic implementation
    float height = GetTexel(TexNum, Texture7, ptexCoords).r;
    return ptexCoords - viewDir.xy * (height * 0.1);

#endif // BASIC_PARALLAX

#if OCCLUSION_PARALLAX

// parallax occlusion mapping
    #if !SHADERDRAWPARAMETERS
        float vParallaxScale = TexCoords[IDX_HEIGHTMAP_INFO].z * 0.025; // arbitrary to get DrawScale into (for this purpose) sane regions.
        float vTimeSeconds = TexCoords[IDX_HEIGHTMAP_INFO].w; // Surface.Level->TimeSeconds
    #endif

    //vParallaxScale += 8.0f * sin(vTimeSeconds) + 4.0 * cos(2.3f * vTimeSeconds);

    // number of depth layers
    const float minLayers = 8;
    const float maxLayers = 32;
    float numLayers = mix(maxLayers, minLayers, abs(dot(vec3(0.0, 0.0, 1.0), viewDir)));
    // calculate the size of each layer
    float layerDepth = 1.0 / numLayers;
    // depth of current layer
    float currentLayerDepth = 0.0;
    // the amount to shift the texture coordinates per layer (from vector P)
    vec2 P = viewDir.xy / viewDir.z * vParallaxScale;
    vec2 deltaTexCoords = P / numLayers;

    // get initial values
    vec2  currentTexCoords     = ptexCoords;
    float currentDepthMapValue = 0.0;

    currentDepthMapValue = GetTexel(TexNum, Texture7, currentTexCoords).r;

    while(currentLayerDepth < currentDepthMapValue)
    {
        // shift texture coordinates along direction of P
        currentTexCoords -= deltaTexCoords;

        // get depthmap value at current texture coordinates
        currentDepthMapValue = GetTexel(TexNum, Texture7, currentTexCoords).r;        

        // get depth of next layer
        currentLayerDepth += layerDepth;
    }

    // get texture coordinates before collision (reverse operations)
    vec2 prevTexCoords = currentTexCoords + deltaTexCoords;

    // get depth after and before collision for linear interpolation
    float afterDepth  = currentDepthMapValue - currentLayerDepth;
    float beforeDepth = GetTexel(TexNum, Texture7, currentTexCoords).r - currentLayerDepth + layerDepth;    

    // interpolation of texture coordinates
    float weight = afterDepth / (afterDepth - beforeDepth);
    vec2 finalTexCoords = prevTexCoords * weight + currentTexCoords * (1.0 - weight);

    return finalTexCoords;
#endif // OCCLUSION_PARALLAX

#if RELIEF_PARALLAX

// Relief Parallax Mapping

    // determine required number of layers
   const float minLayers = 10.0;
   const float maxLayers = 15.0;
   float numLayers = mix(maxLayers, minLayers, abs(dot(vec3(0, 0, 1), viewDir)));

    #if !SHADERDRAWPARAMETERS
        float vParallaxScale = TexCoords[IDX_HEIGHTMAP_INFO].z * 0.025; // arbitrary to get DrawScale into (for this purpose) sane regions.
        float vTimeSeconds = TexCoords[IDX_HEIGHTMAP_INFO].w; // Surface.Level->TimeSeconds
    #endif

   // height of each layer
   float layerHeight = 1.0 / numLayers;
   // depth of current layer
   float currentLayerHeight = 0.0;
   // shift of texture coordinates for each iteration
   vec2 dtex = vParallaxScale * viewDir.xy / viewDir.z / numLayers;

   // current texture coordinates
   vec2 currentTexCoords = ptexCoords;

   // depth from heightmap
   float heightFromTexture = GetTexel(TexNum, Texture7, currentTexCoords).r;

   // while point is above surface
   while(heightFromTexture > currentLayerHeight)
   {
      // go to the next layer
      currentLayerHeight += layerHeight;

      // shift texture coordinates along V
      currentTexCoords -= dtex;

      // new depth from heightmap
      heightFromTexture = GetTexel(TexNum, Texture7, currentTexCoords).r;
   }

   ///////////////////////////////////////////////////////////
   // Start of Relief Parallax Mapping

   // decrease shift and height of layer by half
   vec2 deltaTexCoord = dtex / 2.0;
   float deltaHeight = layerHeight / 2.0;

   // return to the mid point of previous layer
   currentTexCoords += deltaTexCoord;
   currentLayerHeight -= deltaHeight;

   // binary search to increase precision of Steep Paralax Mapping
   const int numSearches = 5;
   for(int i=0; i<numSearches; i++)
   {
      // decrease shift and height of layer by half
      deltaTexCoord /= 2.0;
      deltaHeight /= 2.0;

      // new depth from heightmap
      heightFromTexture = GetTexel(TexNum, Texture7, currentTexCoords).r;

      // shift along or agains vector V
      if(heightFromTexture > currentLayerHeight) // below the surface
      {
         currentTexCoords -= deltaTexCoord;
         currentLayerHeight += deltaHeight;
      }
      else // above the surface
      {
         currentTexCoords += deltaTexCoord;
         currentLayerHeight -= deltaHeight;
      }
   }

   // return results
   parallaxHeight = currentLayerHeight;
   return currentTexCoords;

#endif // RELIEF_PARALLAX
    return ptexCoords;
}


// unused. Maybe later.
/*
float parallaxSoftShadowMultiplier(in vec3 L, in vec2 initialTexCoord, in float initialHeight)
{
   float shadowMultiplier = 1;

   const float minLayers = 15;
   const float maxLayers = 30;

   #if !SHADERDRAWPARAMETERS
        float vParallaxScale = TexCoords[IDX_MACRO_INFO].w * 0.025; // arbitrary to get DrawScale into (for this purpose) sane regions.
   #endif

   // calculate lighting only for surface oriented to the light source
   if(dot(vec3(0, 0, 1), L) > 0)
   {
      // calculate initial parameters
      float numSamplesUnderSurface = 0;
      shadowMultiplier = 0;
      float numLayers = mix(maxLayers, minLayers, abs(dot(vec3(0, 0, 1), L)));
      float layerHeight = initialHeight / numLayers;
      vec2 texStep = vParallaxScale * L.xy / L.z / numLayers;

      // current parameters
      float currentLayerHeight = initialHeight - layerHeight;
      vec2 currentTexCoords = initialTexCoord + texStep;
      float heightFromTexture = GetTexel(vMacroTexNum, Texture7, currentTexCoords).r;

      int stepIndex = 1;

      // while point is below depth 0.0 )
      while(currentLayerHeight > 0)
      {
         // if point is under the surface
         if(heightFromTexture < currentLayerHeight)
         {
            // calculate partial shadowing factor
            numSamplesUnderSurface += 1;
            float newShadowMultiplier = (currentLayerHeight - heightFromTexture) *
                                             (1.0 - stepIndex / numLayers);
            shadowMultiplier = max(shadowMultiplier, newShadowMultiplier);
         }

         // offset to the next layer
         stepIndex += 1;
         currentLayerHeight -= layerHeight;
         currentTexCoords += texStep;
         heightFromTexture = GetTexel(vMacroTexNum, Texture7, currentTexCoords).r;
      }

      // Shadowing factor should be 1 if there were no points under the surface
      if(numSamplesUnderSurface < 1)
      {
         shadowMultiplier = 1;
      }
      else
      {
         shadowMultiplier = 1.0 - shadowMultiplier;
      }
   }
   return shadowMultiplier;
}
*/
#endif

#if 1
void main (void)
{
    mat3 InFrameCoords = mat3(FrameCoords[1].xyz, FrameCoords[2].xyz, FrameCoords[3].xyz); // TransformPointBy...
    mat3 InFrameUncoords = mat3(FrameUncoords[1].xyz, FrameUncoords[2].xyz, FrameUncoords[3].xyz);

	vec4 TotalColor = vec4(1.0);
    vec2 texCoords = vTexCoords;

#if !SHADERDRAWPARAMETERS
	uint vDrawFlags        = DrawFlags[0];
	uint vTextureFormat    = DrawFlags[1];
	uint vPolyFlags        = DrawFlags[2];
	uint vRendMap          = DrawFlags[3];
	bool bHitTesting       = bool(TexNum[12]);
	float vBaseDiffuse     = TexCoords[IDX_DIFFUSE_INFO].x;
	float vBaseAlpha       = TexCoords[IDX_DIFFUSE_INFO].z;
	float vGamma           = TexCoords[IDX_Z_AXIS].w;
	vec4 vDrawColor        = TexCoords[IDX_DRAWCOLOR];
	vec4 vBumpMapInfo      = TexCoords[IDX_BUMPMAP_INFO];
	vec4 vDistanceFogColor = TexCoords[IDX_DISTANCE_FOG_COLOR];
	vec4 vDistanceFogInfo  = TexCoords[IDX_DISTANCE_FOG_INFO];
	vec4 vHeightMapInfo    = TexCoords[IDX_HEIGHTMAP_INFO];
# if BINDLESSTEXTURES
   	uint vTexNum		   = TexNum[0];
	uint vLightMapTexNum   = TexNum[1];
	uint vFogMapTexNum     = TexNum[2];
	uint vDetailTexNum     = TexNum[3];
	uint vMacroTexNum      = TexNum[4];
	uint vBumpMapTexNum    = TexNum[5];
	uint vEnviroMapTexNum  = TexNum[6];
	uint vHeightMapTexNum  = TexNum[7];
#else
    uint vTexNum		   = 0u;
	uint vLightMapTexNum   = 0u;
	uint vFogMapTexNum     = 0u;
	uint vDetailTexNum     = 0u;
	uint vMacroTexNum      = 0u;
	uint vBumpMapTexNum    = 0u;
	uint vEnviroMapTexNum  = 0u;
	uint vHeightMapTexNum  = 0u;
# endif
#else
# if EDITOR
	bool bHitTesting       = bool(vHitTesting);
# endif
#endif

#if HARDWARELIGHTS || BUMPMAPS
    vec3 TangentViewDir  = normalize( vTangentViewPos - vTangentFragPos );
    int NumLights = int(LightData4[0].y);

    #if !SHADERDRAWPARAMETERS
        vBumpMapSpecular = TexCoords[IDX_BUMPMAP_INFO].y;
    #endif

#if BASIC_PARALLAX || OCCLUSION_PARALLAX || RELIEF_PARALLAX
    // ParallaxMap
    float parallaxHeight = 1.0;
    if ((vDrawFlags & DF_HeightMap) == DF_HeightMap)
    {
        // get new texture coordinates from Parallax Mapping
        texCoords = ParallaxMapping(vTexCoords, TangentViewDir, vHeightMapTexNum, parallaxHeight);
        //if(texCoords.x > 1.0 || texCoords.y > 1.0 || texCoords.x < 0.0 || texCoords.y < 0.0)
        //  discard;// texCoords = vTexCoords;
    }
#endif

#endif
    vec4 Color = GetTexel(vTexNum, Texture0, texCoords);

    if (vBaseDiffuse > 0.0)
        Color *= vBaseDiffuse; // Diffuse factor.

	if (vBaseAlpha > 0.0)
		Color.a *= vBaseAlpha; // Alpha.

    if (vTextureFormat == TEXF_BC5) //BC5 (GL_COMPRESSED_RG_RGTC2) compression
        Color.b = sqrt(1.0 - Color.r*Color.r + Color.g*Color.g);

	// Handle PF_Masked.
	if ( (vPolyFlags&PF_Masked) == PF_Masked )
	{
		if(Color.a < 0.5)
			discard;
		else Color.rgb /= Color.a;
	}
	else if ( (vPolyFlags&PF_AlphaBlend) == PF_AlphaBlend && Color.a < 0.01 )
		discard;

/*	if ((vPolyFlags&PF_Mirrored) == PF_Mirrored)
	{
		//add mirror code here.
	}
*/

	TotalColor=Color;

    vec4 LightColor = vec4(1.0);
#if HARDWARELIGHTS
		float LightAdd = 0.0f;
		LightColor = vec4(0.0);

		for (int i=0; i < NumLights; i++)
		{
			float WorldLightRadius = LightData4[i].x;
			float LightRadius = LightData2[i].w;
			float RWorldLightRadius = WorldLightRadius*WorldLightRadius;

			vec3 InLightPos = ((LightPos[i].xyz - FrameCoords[0].xyz)*InFrameCoords); // Frame->Coords.
			float dist = distance(vCoords, InLightPos);

			if (dist < RWorldLightRadius)
			{
				// Light color
				vec4 CurrentLightColor = vec4(LightData1[i].x,LightData1[i].y,LightData1[i].z, 1.0);

				float MinLight = 0.05;
				float b = WorldLightRadius / (RWorldLightRadius * MinLight);
				float attenuation = WorldLightRadius / (dist+b*dist*dist);

				//float attenuation = 0.82*(1.0-smoothstep(LightRadius,24.0*LightRadius+0.50,dist));

				LightColor += CurrentLightColor * attenuation;
			}
		}
		TotalColor *= LightColor;
#else
		// LightMap
		if ((vDrawFlags & DF_LightMap) == DF_LightMap)
		{
            LightColor = GetTexel(vLightMapTexNum, Texture1, vLightMapCoords);

            // Fetch lightmap texel. Data in LightMap is in 0..127/255 range, which needs to be scaled to 0..2 range.
# ifdef GL_ES
            LightColor.bgr = LightColor.bgr*(2.0*255.0/127.0);
# else
            LightColor.rgb = LightColor.rgb*(2.0*255.0/127.0);
# endif
			LightColor.a = 1.0;
		}
#endif

	// DetailTextures
#if DETAILTEXTURES
	if (((vDrawFlags & DF_DetailTexture) == DF_DetailTexture))
	{
        float NearZ = vCoords.z/512.0;
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
                DetailTexColor = GetTexel(vDetailTexNum, Texture3, vDetailTexCoords * DetailScale);

                vec3 hsvDetailTex = rgb2hsv(DetailTexColor.rgb); // cool idea Han :)
                hsvDetailTex.b += (DetailTexColor.r - 0.1);
                hsvDetailTex = hsv2rgb(hsvDetailTex);
                DetailTexColor=vec4(hsvDetailTex,0.0);
                DetailTexColor = mix(vec4(1.0,1.0,1.0,1.0), DetailTexColor, bNear); //fading out.

                TotalColor.rgb*=DetailTexColor.rgb;
            }
        }
	}
#endif

	// MacroTextures
#if MACROTEXTURES
	if ((vDrawFlags & DF_MacroTexture) == DF_MacroTexture)
	{
		vec4 MacrotexColor = GetTexel(vMacroTexNum, Texture4, vMacroTexCoords);

		if ( (vPolyFlags&PF_Masked) == PF_Masked )
        {
            if(MacrotexColor.a < 0.5)
                discard;
            else MacrotexColor.rgb /= MacrotexColor.a;
        }
        else if ( (vPolyFlags&PF_AlphaBlend) == PF_AlphaBlend && MacrotexColor.a < 0.01 )
            discard;

		vec3 hsvMacroTex = rgb2hsv(MacrotexColor.rgb);
		hsvMacroTex.b += (MacrotexColor.r - 0.1);
		hsvMacroTex = hsv2rgb(hsvMacroTex);
		MacrotexColor=vec4(hsvMacroTex,1.0);
		TotalColor*=MacrotexColor;
	}
#endif

	// BumpMap (Normal Map)
#if BUMPMAPS
	if ((vDrawFlags & DF_BumpMap) == DF_BumpMap)
	{
		//normal from normal map
		vec3 TextureNormal = normalize(GetTexel(vBumpMapTexNum, Texture5, texCoords).rgb * 2.0 - 1.0); // has to be texCoords instead of vBumpTexCoords, otherwise alignment won't work on bumps.
		vec3 BumpColor;
		vec3 TotalBumpColor=vec3(0.0,0.0,0.0);

		for(int i=0; i<NumLights; ++i)
		{
		    vec3 CurrentLightColor = vec3(LightData1[i].x,LightData1[i].y,LightData1[i].z);

			float NormalLightRadius = LightData5[i].x;
            bool bZoneNormalLight = bool(LightData5[i].y);
            float LightBrightness = LightData5[i].z/255.0; // use LightBrightness to adjust specular reflection.

            if (NormalLightRadius == 0.0)
                NormalLightRadius = LightData2[i].w * 64.0;

			bool bSunlight = (uint(LightData2[i].x) == LE_Sunlight);
			vec3 InLightPos = ((LightPos[i].xyz - FrameCoords[0].xyz)*InFrameCoords); // Frame->Coords.

			float dist = distance(vCoords, InLightPos);

            float MinLight = 0.05;
            float b = NormalLightRadius / (NormalLightRadius * NormalLightRadius * MinLight);
            float attenuation = NormalLightRadius / (dist+b*dist*dist);

			if ( (vPolyFlags&PF_Unlit) == PF_Unlit)
				InLightPos=vec3(1.0,1.0,1.0); //no idea whats best here. Arbitrary value based on some tests.

			if ( (NormalLightRadius == 0.0 || (dist > NormalLightRadius) || ( bZoneNormalLight && (LightData4[i].z != LightData4[i].w))) && !bSunlight)// Do not consider if not in range or in a different zone.
				continue;

			vec3 TangentLightPos = vTBNMat * InLightPos;
            vec3 TangentlightDir = normalize( TangentLightPos - vTangentFragPos );

            // ambient
            vec3 ambient = 0.1 * TotalColor.xyz;

            // diffuse
            float diff = max(dot(TangentlightDir, TextureNormal), 0.0);
            vec3 diffuse = diff * TotalColor.xyz;

            // specular
            vec3 halfwayDir = normalize(TangentlightDir + TangentViewDir);
            float spec = pow(max(dot(TextureNormal, halfwayDir), 0.0), 8.0);
            vec3 specular = vec3(max(vBumpMapSpecular,0.1)) * spec * CurrentLightColor * LightBrightness;

            TotalBumpColor += (ambient + diffuse + specular) * attenuation;
		}
		TotalColor+=vec4(clamp(TotalBumpColor,0.0,1.0),1.0);
	}
#endif

	// FogMap
	vec4 FogColor = vec4(0.0);
	if ((vDrawFlags & DF_FogMap) == DF_FogMap)
        FogColor = GetTexel(vFogMapTexNum, Texture2, vFogMapCoords) * 2.0;

	// EnvironmentMap
#if ENGINE_VERSION==227
	if ((vDrawFlags & DF_EnvironmentMap) == DF_EnvironmentMap)
	{
	    vec4 EnvironmentColor = GetTexel(vEnviroMapTexNum, Texture6, vEnvironmentTexCoords);

        if ( (vPolyFlags&PF_Masked) == PF_Masked )
        {
            if(EnvironmentColor.a < 0.5)
                discard;
            else EnvironmentColor.rgb /= EnvironmentColor.a;
        }
        else if ( (vPolyFlags&PF_AlphaBlend) == PF_AlphaBlend && EnvironmentColor.a < 0.01 )
            discard;

		TotalColor*=vec4(EnvironmentColor.rgb,1.0);
	}
#endif

	//TotalColor=clamp(TotalColor,0.0,1.0); //saturate.

	if((vPolyFlags & PF_Modulated)!=PF_Modulated)
	{
#if EDITOR
        // Gamma
        float InGamma = vGamma*GammaMultiplierUED;
        TotalColor.r=pow(TotalColor.r,1.0/InGamma);
        TotalColor.g=pow(TotalColor.g,1.0/InGamma);
        TotalColor.b=pow(TotalColor.b,1.0/InGamma);
#else
		// Gamma
        float InGamma = vGamma*GammaMultiplier; // vGamma is a value from 0.1 to 1.0
        TotalColor.r=pow(TotalColor.r,1.0/InGamma);
        TotalColor.g=pow(TotalColor.g,1.0/InGamma);
        TotalColor.b=pow(TotalColor.b,1.0/InGamma);
#endif
	}

    if((vPolyFlags & PF_Modulated)!=PF_Modulated)
	{
	    TotalColor  = TotalColor * LightColor;
	}
	else
    {
		TotalColor = TotalColor;
    }
    TotalColor += FogColor;

 // Add DistanceFog, needs to be added after Light has been applied.
#if ENGINE_VERSION==227
	// stijn: Very slow! Went from 135 to 155FPS on CTF-BT-CallousV3 by just disabling this branch even tho 469 doesn't do distance fog
	int FogMode = int(vDistanceFogInfo.w);
	if (FogMode >= 0)
	{
	    FogParameters DistanceFogParams;
        DistanceFogParams.FogStart = vDistanceFogInfo.x;
        DistanceFogParams.FogEnd = vDistanceFogInfo.y;
        DistanceFogParams.FogDensity = vDistanceFogInfo.z;
        DistanceFogParams.FogMode = FogMode;

		if ( (vPolyFlags&PF_Modulated) == PF_Modulated )
			DistanceFogParams.FogColor = vec4(0.5,0.5,0.5,0.0);
		else if ( (vPolyFlags&PF_Translucent) == PF_Translucent && (vPolyFlags&PF_Environment) != PF_Environment)
			DistanceFogParams.FogColor = vec4(0.0,0.0,0.0,0.0);
        else DistanceFogParams.FogColor = vDistanceFogColor;

		DistanceFogParams.FogCoord = abs(vEyeSpacePos.z/vEyeSpacePos.w);
		TotalColor = mix(TotalColor, DistanceFogParams.FogColor, getFogFactor(DistanceFogParams));
	}
#endif

#if EDITOR
	// Editor support.
	if (vRendMap == REN_Zones || vRendMap == REN_PolyCuts || vRendMap == REN_Polys)
	{
		TotalColor +=0.5;
		TotalColor *= vDrawColor;
	}
	else if ( vRendMap==REN_Normals ) //Thank you han!
	{
		// Dot.
		float T = 0.5*dot(normalize(vCoords),vSurfaceNormal);

		// Selected.
		if ( (vPolyFlags&PF_Selected)==PF_Selected )
		{
			TotalColor = vec4(0.0,0.0,abs(T),1.0);
		}
		// Normal.
		else
		{
			TotalColor = vec4(max(0.0,T),max(0.0,-T),0.0,1.0);
		}
	}
	else if ( vRendMap==REN_PlainTex )
	{
		TotalColor = Color;
	}

	if ( (vRendMap!=REN_Normals)  && ((vPolyFlags&PF_Selected) == PF_Selected) )
	{
		TotalColor.r = (TotalColor.r*0.75);
        TotalColor.g = (TotalColor.g*0.75);
        TotalColor.b = (TotalColor.b*0.75) + 0.1;
		TotalColor = clamp(TotalColor,0.0,1.0);
		if(TotalColor.a < 0.5)
			TotalColor.a = 0.51;
	}

    // HitSelection, Zoneview etc.
	if (bHitTesting)
		TotalColor = vDrawColor; // Use ONLY DrawColor.
#endif

# if SIMULATEMULTIPASS
    FragColor	= TotalColor;
    FragColor1  = ((vec4(1.0)-TotalColor)*LightColor);
#else
    FragColor	= TotalColor;
#endif

}
#else
void main(void)
{
    //FragColor = GetTexel(TexNum[0], Texture0, vTexCoords);    
    FragColor = texture(sampler2D(Textures[TexNum[0]]), vTexCoords);

}
#endif

/*
//
// EnviroMap.
//
// Simple GLSL implementation of the C++ code. Should be obsoleted by some fancy
// per pixel sphere mapping implementation. But for now, just use this approach
// as PF_Environment handling is the last missing peace on obsoleting RenderSubsurface.
//
vec2 EnviroMap( vec3 Point, vec3 Normal )
{
	vec3 R = reflect(normalize(Point),Normal);
	return vec2(0.5*dot(R,Uncoords_XAxis)+0.5,0.5*dot(R,Uncoords_YAxis)+0.5);
}
*/
