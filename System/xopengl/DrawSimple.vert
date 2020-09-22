/*=============================================================================
	Vertexshader for DrawSimple, Line drawing.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

layout (location = 0) in vec3 Coords;		// == gl_Vertex
out float gl_ClipDistance[MAX_CLIPPINGPLANES];

void main(void)
{
    mat4 modelviewMat = modelMat * viewMat;
	mat4 modelviewprojMat = projMat * viewMat * modelMat;

	vec4 vEyeSpacePos = modelviewMat*vec4(Coords, 1.0);

	uint ClipIndex = uint(ClipParams.x);

	gl_Position = modelviewprojMat * vec4(Coords, 1.0);
    gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,Coords);
}
