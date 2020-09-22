/*=============================================================================
	Vertexshader for DrawGouraudPolygon, in 227 also DrawGouraudPolygonList.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

layout (location = 0) in vec3 Coords;		// == gl_Vertex
layout (location = 1) in vec4 Normals;		// Normals
layout (location = 2) in vec2 TexCoords;	// TexCoords
layout (location = 3) in vec2 LightMapCoords;
layout (location = 4) in vec4 FogColor;
layout (location = 5) in vec4 TextureInfo; //.z == TextureAlpha , .w ==MacroTexNum
layout (location = 7) in vec4 LightColor;
layout (location = 8) in vec3 TexNum;
layout (location = 9) in vec4 TexUV; // + MacroTexUV
layout (location = 10) in vec4 DetailTexUV; // + Format, DrawFlags

#ifdef GL_ES
//No geometry shader in GL_ES.

flat out uint gTexNum;
flat out uint gDetailTexNum;
flat out uint gBumpTexNum;
flat out uint gDrawFlags;
flat out uint gTextureFormat;

out vec4 gTexUV;
out vec2 gTexCoords;
out vec3 gCoords;
out vec4 gNormals;
out vec4 gEyeSpacePos;
out vec4 gLightColor;
out vec4 gFogColor;
out vec2 gDetailTexUV;
out vec4 gTextureInfo;
out mat3 TBNMat;
out mat4 gviewMat;
out float gl_ClipDistance[MAX_CLIPPINGPLANES];

#else
flat out uint vTexNum;
flat out uint vDetailTexNum;
flat out uint vBumpTexNum;
flat out uint vDrawFlags;
flat out uint vTextureFormat;

out vec2 vTexCoords;
out vec3 vCoords;
out vec4 vNormals;
out vec4 vEyeSpacePos;
out vec4 vLightColor;
out vec4 vFogColor;
out vec4 vTexUV;
out vec2 vDetailTexUV;
out vec4 vLightSpacePos;
out vec4 vTextureInfo;
out	mat4 vprojMat;
out mat4 vmodelMat;
out mat4 vviewMat;
#endif

void main(void)
{
	mat4 modelviewMat = modelMat * viewMat;
	mat4 modelviewprojMat = projMat * viewMat * modelMat;

#ifdef GL_ES

	gEyeSpacePos = modelviewMat*vec4(Coords, 1.0);

	// Point Coords
	gCoords = Coords;

	//Texture UV to fragment
	gTexCoords=TexCoords;

	gLightColor	= LightColor;
	gFogColor	= FogColor;
	gTexUV = TexUV;
	gDetailTexUV = DetailTexUV.xy;
	gNormals = Normals;

	gTexNum = uint(TexNum.x);
	gDetailTexNum = uint(TexNum.y);
	gBumpTexNum = uint(TexNum.z);
	gTextureFormat = uint(DetailTexUV.z);
	gDrawFlags = uint(DetailTexUV.w);

	gTextureInfo = TextureInfo;

	gviewMat = viewMat;

	vec3 T = vec3(1.0,1.0,1.0); //Arbitrary.
	vec3 B = vec3(1.0,1.0,1.0); //Replace with actual values extracted from mesh generation some day.
	vec3 N = normalize(Normals.xyz); //Normals.

	// TBN must have right handed coord system.
	if (dot(cross(N, T), B) < 0.0)
		T = T * -1.0;

	TBNMat = transpose(mat3(T, B, N));

	uint ClipIndex = uint(ClipParams.x);

	gl_Position = modelviewprojMat * vec4(Coords, 1.0);
    gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,gEyeSpacePos.xyz);

#else
	vec4 pos=modelviewprojMat * vec4(Coords, 1.0);

	vLightSpacePos = lightSpaceMat*modelMat*vec4(Coords, 1.0);

	vEyeSpacePos = modelviewMat*vec4(Coords, 1.0);

	// Point Coords
	vCoords = Coords;

	//Texture UV to fragment
	vTexCoords=TexCoords;

	vLightColor	= LightColor;
	vFogColor	= FogColor;
	vTexUV = TexUV;
	vDetailTexUV = DetailTexUV.xy;
	vNormals = Normals;

	vTexNum = uint(TexNum.x);
	vDetailTexNum = uint(TexNum.y);
	vBumpTexNum = uint(TexNum.z);
	vTextureFormat = uint(DetailTexUV.z);
	vDrawFlags = uint(DetailTexUV.w);

	vTextureInfo = TextureInfo;

	gl_Position = vec4(Coords, 1.0);

#endif

}
