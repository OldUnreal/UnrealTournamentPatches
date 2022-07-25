/*=============================================================================
	Vertexshader for DrawComplexSurface, single pass.

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

layout (location = 0) in vec4 Coords;		// == gl_Vertex
layout (location = 1) in vec4 Normal;		// == gl_Vertex

out vec3 vCoords;
out vec4 vEyeSpacePos;
out vec2 vTexCoords;
out vec2 vLightMapCoords;
out vec2 vFogMapCoords;
out vec3 vTangentViewPos;
out vec3 vTangentFragPos;
#if DETAILTEXTURES
out vec2 vDetailTexCoords;
#endif
#if MACROTEXTURES
out vec2 vMacroTexCoords;
#endif
#if BUMPMAPS
out vec2 vBumpTexCoords;
#endif
#if ENGINE_VERSION==227
out vec2 vEnvironmentTexCoords;
#endif
#if EDITOR
flat out vec3 vSurfaceNormal; // f.e. Render normal view.
#endif
#if ENGINE_VERSION==227 || BUMPMAPS
flat out mat3 vTBNMat;
#endif

#if SHADERDRAWPARAMETERS
struct DrawComplexShaderDrawParams
{
	vec4 DiffuseUV;		    // 0
	vec4 LightMapUV;	    // 1
	vec4 FogMapUV;		    // 2
	vec4 DetailUV;		    // 3
	vec4 MacroUV;		    // 4
	vec4 EnviroMapUV;	    // 5
	vec4 DiffuseInfo;	    // 6
	vec4 MacroInfo;		    // 7
	vec4 BumpMapInfo;	    // 8
    vec4 HeightMapInfo;     // 9
	vec4 XAxis;			    // 10
	vec4 YAxis;			    // 11
	vec4 ZAxis;			    // 12
	vec4 DrawColor;		    // 13
	vec4 DistanceFogColor;  // 14
	vec4 DistanceFogInfo;   // 15
	uvec4 TexNum[4];
	uvec4 DrawFlags;
};

layout(std430, binding = 6) buffer AllDrawComplexShaderDrawParams
{
	DrawComplexShaderDrawParams DrawComplexParams[];
};

flat out uint vTexNum;
flat out uint vLightMapTexNum;
flat out uint vFogMapTexNum;
flat out uint vDetailTexNum;
flat out uint vMacroTexNum;
flat out uint vBumpMapTexNum;
flat out uint vEnviroMapTexNum;
flat out uint vHeightMapTexNum;
flat out uint vHeightMapNum;
flat out uint vDrawFlags;
flat out uint vTextureFormat;
flat out uint vPolyFlags;
flat out float vBaseDiffuse;
flat out float vBaseAlpha;
flat out float vParallaxScale;
flat out float vGamma;
flat out float vBumpMapSpecular;
flat out float vTimeSeconds;
# if EDITOR
flat out uint vHitTesting;
flat out uint vRendMap;
flat out vec4 vDrawColor;
# endif
flat out vec4 vDistanceFogColor;
flat out vec4 vDistanceFogInfo;
#else
uniform vec4 TexCoords[16];
uniform uint TexNum[16];
uniform uint DrawFlags[4];
#endif

#ifndef GL_ES
out float gl_ClipDistance[MAX_CLIPPINGPLANES];
#endif

#if 1
void main(void)
{
#if SHADERDRAWPARAMETERS
	vec4 XAxis       = DrawComplexParams[gl_DrawID].XAxis;
	vec4 YAxis       = DrawComplexParams[gl_DrawID].YAxis;
	vec4 ZAxis       = DrawComplexParams[gl_DrawID].ZAxis;
	vec4 DiffuseUV   = DrawComplexParams[gl_DrawID].DiffuseUV;
	vec4 LightMapUV  = DrawComplexParams[gl_DrawID].LightMapUV;
	vec4 FogMapUV    = DrawComplexParams[gl_DrawID].FogMapUV;
	vec4 DetailUV    = DrawComplexParams[gl_DrawID].DetailUV;
	vec4 MacroUV     = DrawComplexParams[gl_DrawID].MacroUV;
	vec4 EnviroMapUV = DrawComplexParams[gl_DrawID].EnviroMapUV;

	vDrawFlags        = DrawComplexParams[gl_DrawID].DrawFlags[0];
	vTextureFormat    = DrawComplexParams[gl_DrawID].DrawFlags[1];
	vPolyFlags        = DrawComplexParams[gl_DrawID].DrawFlags[2];
# if EDITOR
	vRendMap          = DrawComplexParams[gl_DrawID].DrawFlags[3];
	vHitTesting       = DrawComplexParams[gl_DrawID].TexNum[3].x
	vDrawColor        = DrawComplexParams[gl_DrawID].DrawColor;
# endif
	vTexNum			  = DrawComplexParams[gl_DrawID].TexNum[0].x;
	vLightMapTexNum   = DrawComplexParams[gl_DrawID].TexNum[0].y;
	vFogMapTexNum     = DrawComplexParams[gl_DrawID].TexNum[0].z;
	vDetailTexNum     = DrawComplexParams[gl_DrawID].TexNum[0].w;
	vMacroTexNum      = DrawComplexParams[gl_DrawID].TexNum[1].x;
	vBumpMapTexNum    = DrawComplexParams[gl_DrawID].TexNum[1].y;
	vEnviroMapTexNum  = DrawComplexParams[gl_DrawID].TexNum[1].z;
	vHeightMapTexNum  = DrawComplexParams[gl_DrawID].TexNum[1].w;
	vBaseDiffuse      = DrawComplexParams[gl_DrawID].DiffuseInfo.x;
	vBaseAlpha        = DrawComplexParams[gl_DrawID].DiffuseInfo.z;
	vBumpMapSpecular  = DrawComplexParams[gl_DrawID].BumpMapInfo.y;
	vParallaxScale    = DrawComplexParams[gl_DrawID].HeightMapInfo.z * 0.025;
	vTimeSeconds      = DrawComplexParams[gl_DrawID].HeightMapInfo.w;
	vGamma            = ZAxis.w;
	vDistanceFogColor = DrawComplexParams[gl_DrawID].DistanceFogColor;
	vDistanceFogInfo  = DrawComplexParams[gl_DrawID].DistanceFogInfo;
#else
	vec4 XAxis       = TexCoords[IDX_X_AXIS];
	vec4 YAxis       = TexCoords[IDX_Y_AXIS];
	vec4 ZAxis       = TexCoords[IDX_Z_AXIS];
	vec4 DiffuseUV   = TexCoords[IDX_DIFFUSE_COORDS];
	vec4 LightMapUV  = TexCoords[IDX_LIGHTMAP_COORDS];
	vec4 FogMapUV    = TexCoords[IDX_FOGMAP_COORDS];
	vec4 DetailUV    = TexCoords[IDX_DETAIL_COORDS];
	vec4 MacroUV     = TexCoords[IDX_MACRO_COORDS];
	vec4 EnviroMapUV = TexCoords[IDX_ENVIROMAP_COORDS];

	uint vDrawFlags  = DrawFlags[0];
#endif

	// Point Coords
	vCoords = Coords.xyz;

	// UDot/VDot calculation.
	vec3 MapCoordsXAxis = XAxis.xyz;
	vec3 MapCoordsYAxis = YAxis.xyz;
#if EDITOR || ENGINE_VERSION==227 || BUMPMAPS
	vec3 MapCoordsZAxis = ZAxis.xyz;
#endif

	float UDot = XAxis.w;
	float VDot = YAxis.w;

	float MapDotU = dot(MapCoordsXAxis, Coords.xyz) - UDot;
	float MapDotV = dot(MapCoordsYAxis, Coords.xyz) - VDot;
	vec2  MapDot  = vec2(MapDotU, MapDotV);

	//Texture UV to fragment
	vec2 TexMapMult = DiffuseUV.xy;
	vec2 TexMapPan  = DiffuseUV.zw;
	vTexCoords      = (MapDot - TexMapPan) * TexMapMult;

	//Texture UV Lightmap to fragment
	if ((vDrawFlags & DF_LightMap) == DF_LightMap)
	{
		vec2 LightMapMult = LightMapUV.xy;
		vec2 LightMapPan  = LightMapUV.zw;
		vLightMapCoords	  = (MapDot - LightMapPan) * LightMapMult;
	}

	// Texture UV FogMap
	if ((vDrawFlags & DF_FogMap) == DF_FogMap)
	{
		vec2 FogMapMult = FogMapUV.xy;
		vec2 FogMapPan  = FogMapUV.zw;
		vFogMapCoords   = (MapDot - FogMapPan) * FogMapMult;
	}

	// Texture UV DetailTexture
#if DETAILTEXTURES
	if ((vDrawFlags & DF_DetailTexture) == DF_DetailTexture)
	{
		vec2 DetailMult  = DetailUV.xy;
		vec2 DetailPan   = DetailUV.zw;
		vDetailTexCoords = (MapDot - DetailPan) * DetailMult;
	}
#endif

	// Texture UV Macrotexture
#if MACROTEXTURES
	if ((vDrawFlags & DF_MacroTexture) == DF_MacroTexture)
	{
		vec2 MacroMult  = MacroUV.xy;
		vec2 MacroPan   = MacroUV.zw;
		vMacroTexCoords = (MapDot - MacroPan) * MacroMult;
	}
#endif

	// Texture UV EnvironmentMap
#if ENGINE_VERSION==227
	if ((vDrawFlags & DF_EnvironmentMap) == DF_EnvironmentMap)
	{
		vec2 EnvironmentMapMult = EnviroMapUV.xy;
		vec2 EnvironmentMapPan  = EnviroMapUV.zw;
		vEnvironmentTexCoords   = (MapDot - EnvironmentMapPan) * EnvironmentMapMult;
	}
#endif

#if ENGINE_VERSION==227 || BUMPMAPS
    vEyeSpacePos = modelviewMat*vec4(Coords.xyz, 1.0);
    vec3 EyeSpacePos = normalize(FrameCoords[0].xyz);// despite pretty perfect results (so far) this still seems somewhat wrong to me.

	if ((vDrawFlags & (DF_MacroTexture|DF_BumpMap)) != 0u)
	{
		vec3 T = normalize(vec3(MapCoordsXAxis.x,MapCoordsXAxis.y,MapCoordsXAxis.z));
		vec3 B = normalize(vec3(MapCoordsYAxis.x,MapCoordsYAxis.y,MapCoordsYAxis.z));
		vec3 N = normalize(vec3(MapCoordsZAxis.x,MapCoordsZAxis.y,MapCoordsZAxis.z)); //SurfNormals.

		// TBN must have right handed coord system.
		//if (dot(cross(N, T), B) < 0.0)
		//   T = T * -1.0;

		vTBNMat = transpose(mat3(T, B, N));

        vTangentViewPos  = vTBNMat * EyeSpacePos.xyz;
        vTangentFragPos  = vTBNMat * Coords.xyz;
	}
#endif

#if EDITOR
	vSurfaceNormal = MapCoordsZAxis;
#endif

	gl_Position = modelviewprojMat * vec4(Coords.xyz, 1.0);

#if SUPPORTSCLIPDISTANCE
	uint ClipIndex = uint(ClipParams.x);
    gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,Coords.xyz);
#endif // SUPPORTSCLIPDISTANCE
}
#else
void main (void)
{

	vEyeSpacePos = modelviewMat*vec4(Coords.xyz, 1.0);

	// Point Coords
	vCoords = Coords.xyz;

	vTexCoords = vec2(0.0, 0.0);
#if BINDLESSTEXTURES
//	BaseTexNum = uint(TexNums0.x);
#endif
	gl_Position = modelviewprojMat * vec4(Coords.xyz, 1.0);
 }
#endif
