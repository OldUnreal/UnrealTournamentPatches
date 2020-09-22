/*=============================================================================
	Vertexshader for DrawTile.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

layout (location = 0) in vec3 Coords;		// == gl_Vertex
layout (location = 7) in vec4 DrawColor;
layout (location = 8) in float TexNum;

#ifdef GL_ES
//No geometry shader in GL_ES.
layout (location = 2) in vec2 TexCoords;

out vec2 gTexCoords;
out vec4 gDrawColor;
flat out uint gTexNum;
out float gl_ClipDistance[MAX_CLIPPINGPLANES];

#else
layout (location = 2) in vec4 TexCoords0;
layout (location = 9) in vec4 TexCoords1;
layout (location = 10) in vec4 TexCoords2;

out vec3 vCoords;
out vec4 vTexCoords0;
out vec4 vTexCoords1;
out vec4 vTexCoords2;
out vec4 vDrawColor;
flat out uint vTexNum;
out vec4 vEyeSpacePos;

#endif

void main(void)
{
    mat4 modelviewMat = modelMat * viewMat;
#ifdef GL_ES
	mat4 modelviewprojMat = projMat * viewMat * modelMat;
	vec4 gEyeSpacePos = modelviewMat*vec4(Coords, 1.0);

    gTexNum     = uint(TexNum);
	gTexCoords  = TexCoords;
	gDrawColor  = DrawColor;

	uint ClipIndex = uint(ClipParams.x);

	gl_Position = modelviewprojMat * vec4(Coords, 1.0);
    gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,Coords.xyz);
#else
    vEyeSpacePos = modelviewMat*vec4(Coords, 1.0);
    vCoords = Coords;

    vTexNum     = uint(TexNum);
    vTexCoords0 = TexCoords0;
    vTexCoords1 = TexCoords1;
    vTexCoords2 = TexCoords2;
    vDrawColor  = DrawColor;

	gl_Position = vec4(Coords, 1.0);
#endif
}

