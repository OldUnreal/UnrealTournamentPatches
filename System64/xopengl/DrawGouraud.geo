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
flat in uint vMacroTexNum[];
flat in uint vDrawFlags[];
flat in uint vTextureFormat[];
flat in uint vPolyFlags[];
flat in float vGamma[];

flat in vec3 vTextureInfo[]; // diffuse, alpha, bumpmap specular
flat in vec4 vDistanceFogColor[];
flat in vec4 vDistanceFogInfo[];

#if EDITOR
flat in vec4 vDrawColor[];
flat in uint vRendMap[];
flat in uint vHitTesting[];
#endif

in vec3 vCoords[];
in vec4 vNormals[];
in vec2 vTexCoords[];
in vec2 vDetailTexCoords[];
in vec2 vMacroTexCoords[];
in vec4 vEyeSpacePos[];
in vec4 vLightColor[];
in vec4 vFogColor[];

flat out uint gTexNum;
flat out uint gDetailTexNum;
flat out uint gBumpTexNum;
flat out uint gMacroTexNum;
flat out uint gDrawFlags;
flat out uint gTextureFormat;
flat out uint gPolyFlags;
flat out float gGamma;

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

flat out vec3 gTextureInfo;
flat out vec4 gDistanceFogColor;
flat out vec4 gDistanceFogInfo;
#if EDITOR
flat out vec4 gDrawColor;
flat out uint gRendMap;
flat out uint gHitTesting;
#endif

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
    mat3 InFrameCoords = mat3(FrameCoords[1].xyz, FrameCoords[2].xyz, FrameCoords[3].xyz); // TransformPointBy...
    mat3 InFrameUncoords = mat3(FrameUncoords[1].xyz, FrameUncoords[2].xyz, FrameUncoords[3].xyz);

	vec3 Tangent = GetTangent(vCoords[0], vCoords[1], vCoords[2], vTexCoords[0], vTexCoords[1], vTexCoords[2]);
	vec3 Bitangent = GetBitangent(vCoords[0], vCoords[1], vCoords[2], vTexCoords[0], vTexCoords[1], vTexCoords[2]);
    uint ClipIndex = uint(ClipParams.x);

	for(int i=0; i<3; ++i)
	{
		vec3 T = normalize(vec3(modelMat * vec4(Tangent,0.0)));
		vec3 B = normalize(vec3(modelMat * vec4(Bitangent,0.0)));
		vec3 N = normalize(vec3(modelMat * vNormals[i]));

		// TBN must have right handed coord system.
		//if (dot(cross(N, T), B) < 0.0)
		//		T = T * -1.0;

		gTBNMat = mat3(T, B, N);

		gEyeSpacePos = vEyeSpacePos[i];
		gLightColor = vLightColor[i];
		gFogColor = vFogColor[i];
		gNormals = vNormals[i];
		gTexCoords = vTexCoords[i];
		gDetailTexCoords = vDetailTexCoords[i];
		gMacroTexCoords = vMacroTexCoords[i];
		gCoords = vCoords[i];
		gTexNum = vTexNum[i];
		gDetailTexNum = vDetailTexNum[i];
		gBumpTexNum = vBumpTexNum[i];
		gMacroTexNum = vMacroTexNum[i];
		gTextureInfo = vTextureInfo[i];
		gDrawFlags = vDrawFlags[i];
		gPolyFlags = vPolyFlags[i];
		gGamma = vGamma[i];
		gTextureFormat = vTextureFormat[i];
		gDistanceFogColor = vDistanceFogColor[i];
		gDistanceFogInfo = vDistanceFogInfo[i];

        gTangentViewPos  = gTBNMat * normalize(FrameCoords[0].xyz);
        gTangentFragPos  = gTBNMat * gCoords.xyz;

#if EDITOR
		gDrawColor = vDrawColor[i];
		gRendMap = vRendMap[i];
		gHitTesting = vHitTesting[i];
#endif
		gl_Position = modelviewprojMat * gl_in[i].gl_Position;
        gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,vCoords[i]);
		EmitVertex();
	}
}
