/*=============================================================================
	Vertexshader for DrawGouraudPolygon, in 227 also DrawGouraudPolygonList.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

// DrawGouraud DrawData Indices
const uint IDX_DIFFUSE_INFO       = 0u;
const uint IDX_DETAIL_MACRO_INFO  = 1u;
const uint IDX_MISC_INFO          = 2u;
const uint IDX_EDITOR_DRAWCOLOR   = 3u;
const uint IDX_DISTANCE_FOG_COLOR = 4u;
const uint IDX_DISTANCE_FOG_INFO  = 5u;

layout (location = 0) in vec3 Coords;		// == gl_Vertex
layout (location = 1) in vec3 Normals;		// Normals
layout (location = 2) in vec2 TexCoords;	// TexCoords
layout (location = 3) in vec4 LightColor;
layout (location = 4) in vec4 FogColor;

#ifdef GL_ES
//No geometry shader in GL_ES.

flat out uint gTexNum;
flat out uint gDetailTexNum;
flat out uint gBumpTexNum;
flat out uint gMacroTexNum;
flat out uint gDrawFlags;
flat out uint gTextureFormat;
flat out uint gPolyFlags;
flat out float gGamma;

flat out vec3 gTextureInfo; // diffuse, alpha, bumpmap specular
flat out vec4 gDistanceFogColor;
flat out vec4 gDistanceFogInfo;

out vec3 gCoords;
out vec4 gNormals;
out vec2 gTexCoords;
out vec2 gDetailTexCoords;
out vec2 gMacroTexCoords;
out vec4 gEyeSpacePos;
out vec4 gLightColor;
out vec4 gFogColor;
out mat3 gTBNMat;
out vec3 gTangentViewPos;
out vec3 gTangentFragPos;

# if EDITOR
flat out vec4 gDrawColor;
flat out uint gRendMap;
flat out uint gHitTesting;
# endif

uniform vec4 DrawData[6];
uniform uint TexNum[4];
uniform uint DrawFlags[4];

#else // GL_ES

# if SHADERDRAWPARAMETERS
struct DrawGouraudShaderDrawParams
{
	vec4 DiffuseInfo;	    // 0
	vec4 DetailMacroInfo;   // 1
	vec4 MiscInfo;		    // 2
	vec4 DrawColor;		    // 3
	vec4 DistanceFogColor;  // 4
	vec4 DistanceFogInfo;   // 5
	uvec4 TexNum;
	uvec4 DrawFlags;
};

layout(std430, binding = 7) buffer AllDrawGouraudShaderDrawParams
{
	DrawGouraudShaderDrawParams DrawGouraudParams[];
};
# else
uniform vec4 DrawData[6];
uniform uint TexNum[4];
uniform uint DrawFlags[4];
# endif

flat out uint vTexNum;
flat out uint vDetailTexNum;
flat out uint vBumpTexNum;
flat out uint vMacroTexNum;
flat out uint vDrawFlags;
flat out uint vTextureFormat;
flat out uint vPolyFlags;
flat out float vGamma;

flat out vec3 vTextureInfo; // diffuse, alpha, bumpmap specular
flat out vec4 vDistanceFogColor;
flat out vec4 vDistanceFogInfo;

out vec3 vCoords;
out vec4 vNormals;
out vec2 vTexCoords;
out vec2 vDetailTexCoords;
out vec2 vMacroTexCoords;
out vec4 vEyeSpacePos;
out vec4 vLightColor;
out vec4 vFogColor;

# if EDITOR
flat out vec4 vDrawColor;
flat out uint vRendMap;
flat out uint vHitTesting;
# endif

#endif

void main(void)
{
#ifdef GL_ES
	gEyeSpacePos      = modelviewMat*vec4(Coords, 1.0);

	gCoords           = Coords;
	gNormals          = vec4(Normals.xyz, 0);
	gTexCoords        = TexCoords * DrawData[IDX_DIFFUSE_INFO].xy;
	gDetailTexCoords  = TexCoords * DrawData[IDX_DETAIL_MACRO_INFO].xy;
	gMacroTexCoords   = TexCoords * DrawData[IDX_DETAIL_MACRO_INFO].zw;
	gLightColor	      = LightColor;
	gFogColor	      = FogColor;

	gTexNum           = TexNum[0];
	gDetailTexNum     = TexNum[1];
	gBumpTexNum       = TexNum[2];
	gMacroTexNum      = TexNum[3];

	gDrawFlags        = DrawFlags[0];
	gTextureFormat    = uint(DrawData[IDX_MISC_INFO].w);
	gPolyFlags        = DrawFlags[2];
	gGamma            = DrawData[IDX_MISC_INFO].y;

	gTextureInfo      = vec3(DrawData[IDX_DIFFUSE_INFO].zw, DrawData[IDX_MISC_INFO].x);
	gDistanceFogColor = DrawData[IDX_DISTANCE_FOG_COLOR];
	gDistanceFogInfo  = DrawData[IDX_DISTANCE_FOG_INFO];

# if EDITOR
    gHitTesting       = DrawFlags[1];
	gRendMap          = DrawFlags[3];
	gDrawColor        = DrawData[IDX_EDITOR_DRAWCOLOR];
# endif

	vec3 T = vec3(1.0,1.0,1.0); //Arbitrary.
	vec3 B = vec3(1.0,1.0,1.0); //Replace with actual values extracted from mesh generation some day.
	vec3 N = normalize(Normals.xyz); //Normals.

	// TBN must have right handed coord system.
	//if (dot(cross(N, T), B) < 0.0)
	//	T = T * -1.0;

	gTBNMat = transpose(mat3(T, B, N));
    gTangentViewPos  = gTBNMat * normalize(FrameCoords[0].xyz);
    gTangentFragPos  = gTBNMat * gCoords.xyz;

	gl_Position = modelviewprojMat * vec4(Coords, 1.0);

#if SUPPORTSCLIPDISTANCE
	uint ClipIndex = uint(ClipParams.x);
    gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,gEyeSpacePos.xyz);
#endif // SUPPORTSCLIPDISTANCE

#else
	vEyeSpacePos      = modelviewMat*vec4(Coords, 1.0);

	vCoords           = Coords;
	vNormals          = vec4(Normals.xyz, 0);
	vLightColor	      = LightColor;
	vFogColor	      = FogColor;

# if SHADERDRAWPARAMETERS
	vTexCoords        = TexCoords * DrawGouraudParams[gl_DrawID].DiffuseInfo.xy;
	vDetailTexCoords  = TexCoords * DrawGouraudParams[gl_DrawID].DetailMacroInfo.xy;
	vMacroTexCoords   = TexCoords * DrawGouraudParams[gl_DrawID].DetailMacroInfo.zw;

	vTexNum           = DrawGouraudParams[gl_DrawID].TexNum[0];
	vDetailTexNum     = DrawGouraudParams[gl_DrawID].TexNum[1];
	vBumpTexNum       = DrawGouraudParams[gl_DrawID].TexNum[2];
	vMacroTexNum      = DrawGouraudParams[gl_DrawID].TexNum[3];

	vDrawFlags        = DrawGouraudParams[gl_DrawID].DrawFlags[0];
	vTextureFormat    = uint(DrawGouraudParams[gl_DrawID].MiscInfo.w);
	vPolyFlags        = DrawGouraudParams[gl_DrawID].DrawFlags[2];
	vGamma            = DrawGouraudParams[gl_DrawID].MiscInfo.y;

	vTextureInfo      = vec3(
	  DrawGouraudParams[gl_DrawID].DiffuseInfo.zw,
	  DrawGouraudParams[gl_DrawID].MiscInfo.x);
	vDistanceFogColor = DrawGouraudParams[gl_DrawID].DistanceFogColor;
	vDistanceFogInfo  = DrawGouraudParams[gl_DrawID].DistanceFogInfo;

#  if EDITOR
    vHitTesting       = DrawGouraudParams[gl_DrawID].DrawFlags[1];
	vRendMap          = DrawGouraudParams[gl_DrawID].DrawFlags[3];
	vDrawColor        = DrawGouraudParams[gl_DrawID].DrawColor;
#  endif

# else // SHADERDRAWPARAMETERS

	vTexCoords        = TexCoords * DrawData[IDX_DIFFUSE_INFO].xy;
	vDetailTexCoords  = TexCoords * DrawData[IDX_DETAIL_MACRO_INFO].xy;
	vMacroTexCoords   = TexCoords * DrawData[IDX_DETAIL_MACRO_INFO].zw;

	vTexNum           = TexNum[0];
	vDetailTexNum     = TexNum[1];
	vBumpTexNum       = TexNum[2];
	vMacroTexNum      = TexNum[3];

	vDrawFlags        = DrawFlags[0];
	vTextureFormat    = uint(DrawData[IDX_MISC_INFO].w);
	vPolyFlags        = DrawFlags[2];
	vGamma            = DrawData[IDX_MISC_INFO].y;

	vTextureInfo      = vec3(DrawData[IDX_DIFFUSE_INFO].zw, DrawData[IDX_MISC_INFO].x);
	vDistanceFogColor = DrawData[IDX_DISTANCE_FOG_COLOR];
	vDistanceFogInfo  = DrawData[IDX_DISTANCE_FOG_INFO];

#  if EDITOR
    vHitTesting       = DrawFlags[1];
	vRendMap          = DrawFlags[3];
	vDrawColor        = DrawData[IDX_EDITOR_DRAWCOLOR];
#  endif
# endif

	gl_Position = vec4(Coords, 1.0);

#endif

}
