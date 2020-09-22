/*=============================================================================
	Vertexshader for DrawComplexSurface, single pass.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

layout (location = 0) in vec3 Coords;		// == gl_Vertex
layout (location = 1) in vec4 Normals;		// Surface Normals

uniform vec4 TexCoords[16];

out vec3 vCoords;
out vec4 vEyeSpacePos;
out vec2 vTexCoords;
out vec2 vLightMapCoords;
out vec2 vFogMapCoords;
out vec2 vDetailTexCoords;
out vec2 vMacroTexCoords;
out vec2 vBumpTexCoords;
out vec2 vEnvironmentTexCoords;
out vec3 vNormals;
out vec3 Surface_Normal; // f.e. Render normal view.
out mat3 TBNMat;
out float gl_ClipDistance[MAX_CLIPPINGPLANES];

void main(void)
{
	mat4 modelviewMat = modelMat * viewMat;
	mat4 modelviewprojMat = projMat * viewMat * modelMat;

	vEyeSpacePos = modelviewMat*vec4(Coords, 1.0);

	// Point Coords
	vCoords = Coords.xyz;

	// UDot/VDot calculation.
	vec3 MapCoordsXAxis = TexCoords[7].xyz;
	vec3 MapCoordsYAxis = TexCoords[8].xyz;
	vec3 MapCoordsZAxis = TexCoords[9].xyz;
	vec3 MapCoordsOrigin = TexCoords[10].xyz;

	float UDot = dot(MapCoordsXAxis,MapCoordsOrigin);
	float VDot = dot(MapCoordsYAxis,MapCoordsOrigin);
	float MapDotU = dot(MapCoordsXAxis,Coords.xyz) - UDot;
	float MapDotV = dot(MapCoordsYAxis,Coords.xyz) - VDot;
	vec2  MapDot  = vec2(MapDotU,MapDotV);

	vec2 TexMapMult = TexCoords[0].xy;
	vec2 TexMapPan = TexCoords[0].zw;

	vec2 LightMapMult = TexCoords[1].xy;
	vec2 LightMapPan = TexCoords[1].zw;

	vec2 DetailTexMapMult = TexCoords[2].xy;
	vec2 DetailTexMapPan = TexCoords[2].zw;

	vec2 MacroTexMapMult = TexCoords[3].xy;
	vec2 MacroTexMapPan = TexCoords[3].zw;

	vec2 BumpMapTexMapMult = TexCoords[4].xy;
	vec2 BumpMapTexMapPan = TexCoords[4].zw;

	vec2 FogMapTexMapMult = TexCoords[5].xy;
	vec2 FogMapTexMapPan = TexCoords[5].zw;

	vec2 EnvironmentMapTexMapMult = TexCoords[6].xy;
	vec2 EnvironmentMapTexMapPan = TexCoords[6].zw;

	//Texture UV to fragment
	vTexCoords = (MapDot - TexMapPan) * TexMapMult;

	//Texture UV Lightmap to fragment
	vLightMapCoords	= (MapDot - LightMapPan) * LightMapMult;

	// Texture UV DetailTexture
	vDetailTexCoords = (MapDot - DetailTexMapPan) * DetailTexMapMult;

	// Texture UV Macrotexture
	vMacroTexCoords = (MapDot - MacroTexMapPan) * MacroTexMapMult;

	// Texture UV BumpMap
	vBumpTexCoords = (MapDot - BumpMapTexMapPan) * BumpMapTexMapMult;

	// Texture UV FogMap
	vFogMapCoords = (MapDot - FogMapTexMapPan) * FogMapTexMapMult;

	// Texture UV EnvironmentMap
	vEnvironmentTexCoords = (MapDot - EnvironmentMapTexMapPan) * EnvironmentMapTexMapMult;

	vec3 T = normalize(vec3(-MapCoordsXAxis.x,MapCoordsXAxis.y,MapCoordsXAxis.z));
	vec3 B = normalize(vec3(MapCoordsYAxis.x,-MapCoordsYAxis.y,-MapCoordsYAxis.z));
	vec3 N = normalize(vec3(-MapCoordsZAxis.x,MapCoordsZAxis.y,MapCoordsZAxis.z)); //SurfNormals.

	// TBN must have right handed coord system.
	if (dot(cross(N, T), B) < 0.0)
		T = T * -1.0;

	TBNMat = transpose(mat3(T, B, N));

	Surface_Normal = MapCoordsZAxis;

	// Normals
	vNormals = Normals.xyz;

	uint ClipIndex = uint(ClipParams.x);


	gl_Position = modelviewprojMat * vec4(Coords, 1.0);
    gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,Coords);
}
