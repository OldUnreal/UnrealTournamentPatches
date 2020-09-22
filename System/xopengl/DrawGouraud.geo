/*=============================================================================
	Geometryshader for DrawGouraud

	For BumpMap (normal map), tangent and bitangent calculation.
	Read https://wiki.delphigl.com/index.php/TBN_Matrix

	Revision history:
		* Created by Smirftsch
=============================================================================*/

layout(triangles) in;
layout(triangle_strip, max_vertices=3) out;

flat in uint vTexNum[];
flat in uint vDetailTexNum[];
flat in uint vBumpTexNum[];
flat in uint vDrawFlags[];
flat in uint vTextureFormat[];

in vec4 vTexUV[];
in vec2 vTexCoords[];
in vec3 vCoords[];
in vec4 vNormals[];
in vec4 vEyeSpacePos[];
in vec4 vLightColor[];
in vec4 vFogColor[];
in vec4 vDistanceFogColor[];
in vec2 vDetailTexUV[];
in vec4 vLightSpacePos[];
in vec4 vTextureInfo[];

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
out vec4 gLightSpacePos;
out vec4 gTextureInfo;
out mat3 TBNMat;
out float gl_ClipDistance[MAX_CLIPPINGPLANES];

vec3 GetTangent(vec3 A, vec3 B, vec3 C,  vec2 Auv, vec2 Buv, vec2 Cuv)
{
	float Bv_Cv = Buv.y - Cuv.y;
	if(Bv_Cv == 0.0)
	return (B-C)/(Buv.x-Cuv.x);

	float Quotient = (Auv.y - Cuv.y)/(Bv_Cv);
	vec3 D   = C   + (B  -C)   * Quotient;
	vec2 Duv = Cuv + (Buv-Cuv) * Quotient;
	return (D-A)/(Duv.x - Auv.x);
}
vec3 GetBitangent(vec3 A, vec3 B, vec3 C,  vec2 Auv, vec2 Buv, vec2 Cuv)
{
	return GetTangent(A, C, B,  Auv.yx, Cuv.yx, Buv.yx);
}

void main(void)
{
	vec3 Tangent = GetTangent(vCoords[0], vCoords[1], vCoords[2], vTexCoords[0], vTexCoords[1], vTexCoords[2]);
	vec3 Bitangent = GetBitangent(vCoords[0], vCoords[1], vCoords[2], vTexCoords[0], vTexCoords[1], vTexCoords[2]);
    uint ClipIndex = uint(ClipParams.x);

	for(int i=0; i<3; ++i)
	{
		mat4 vmodelviewprojMat = projMat * viewMat * modelMat;

		vec3 T = normalize(vec3(modelMat[i] * vec4(Tangent,0.0)));
		vec3 B = normalize(vec3(modelMat[i] * vec4(Bitangent,0.0)));
		vec3 N = normalize(vec3(modelMat[i] * vNormals[i]));
		// TBN must have right handed coord system.
		if (dot(cross(N, T), B) < 0.0)
				T = T * -1.0;
		TBNMat = mat3(T, B, N);

		gEyeSpacePos = vEyeSpacePos[i];
		gLightColor = vLightColor[i];
		gFogColor = vFogColor[i];
		gTexUV = vTexUV[i];
		gDetailTexUV = vDetailTexUV[i];
		gNormals = vNormals[i];
		gTexCoords = vTexCoords[i];
		gCoords = vCoords[i];
		gTexNum = vTexNum[i];
		gDetailTexNum = vDetailTexNum[i];
		gBumpTexNum = vBumpTexNum[i];
		gLightSpacePos = vLightSpacePos[i];
		gTextureInfo = vTextureInfo[i];
		gDrawFlags = vDrawFlags[i];
		gTextureFormat = vTextureFormat[i];

		gl_Position = vmodelviewprojMat * gl_in[i].gl_Position;
        gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,vCoords[i]);//
		EmitVertex();
	}
}
