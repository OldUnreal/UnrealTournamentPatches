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
flat out vec4 gDrawColor;
flat out uint gTexNum;

#else
layout (location = 2) in vec4 TexCoords0;
layout (location = 9) in vec4 TexCoords1;
layout (location = 10) in vec4 TexCoords2;

out vec3 vCoords;
out vec4 vTexCoords0;
out vec4 vTexCoords1;
out vec4 vTexCoords2;
flat out vec4 vDrawColor;
flat out uint vTexNum;
out vec4 vEyeSpacePos;

#endif

/*
#if SHADERDRAWPARAMETERS
struct DrawTileShaderDrawParams
{
	vec4 FrameCoords;  // (RFX2, RFY2, FX2, FY2)
	vec4 TextureInfo;  // (UMult, VMult, TexNum, Gamma)
	vec4 DrawColor;    // Color for the tile
	vec4 HitDrawColor; // Selection color for UEd
	uvec4 DrawParams;  // (PolyFlags, bHitTesting, unused, unused)
};

layout(std430, binding = 6) buffer AllDrawTileShaderDrawParams
{
	DrawTileShaderDrawParams DrawTileParams[];
};

flat out uint vTexNum;
flat out uint vPolyFlags;
flat out float vGamma;
# if EDITOR
flat out bool vHitTesting;
flat out vec4 vHitDrawColor;
# endif
#endif
*/

void main(void)
{
#ifdef GL_ES
	vec4 gEyeSpacePos = modelviewMat*vec4(Coords, 1.0);

    gTexNum     = uint(TexNum);
	gTexCoords  = TexCoords;
	gDrawColor  = DrawColor;

	gl_Position = modelviewprojMat * vec4(Coords, 1.0);
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

