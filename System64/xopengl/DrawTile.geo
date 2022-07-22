/*=============================================================================
	Geoshader for DrawTile.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

layout(triangles) in;
layout(triangle_strip, max_vertices = 6) out;

flat in uint vTexNum[];
in vec4 vTexCoords0[];
in vec4 vTexCoords1[];
in vec4 vTexCoords2[];
flat in vec4 vDrawColor[];
in vec4 vEyeSpacePos[];
in vec3 vCoords[];

out vec2 gTexCoords;
flat out vec4 gDrawColor;
flat out uint gTexNum;
out float gl_ClipDistance[MAX_CLIPPINGPLANES];


void main()
{
	uint ClipIndex = uint(ClipParams.x);

	gTexNum = vTexNum[0];

	float RFX2=vTexCoords0[0].x;
	float RFY2=vTexCoords0[0].y;
	float FX2=vTexCoords0[0].z;
	float FY2=vTexCoords0[0].w;

	float U=vTexCoords1[0].x;
	float V=vTexCoords1[0].y;
	float UL=vTexCoords1[0].z;
	float VL=vTexCoords1[0].w;

	float XL=vTexCoords2[0].x;
	float YL=vTexCoords2[0].y;
	float UMult=vTexCoords2[0].z;
	float VMult=vTexCoords2[0].w;

	float X = gl_in[0].gl_Position.x;
	float Y = gl_in[0].gl_Position.y;
	float Z = gl_in[0].gl_Position.z;

	vec3 Position;

	// 0
	Position.x = RFX2*Z*( X - FX2);
	Position.y = RFY2*Z*( Y - FY2);
	Position.z = Z;
	gTexCoords.x = (U)*UMult;
	gTexCoords.y = (V)*VMult;

	gDrawColor=vDrawColor[0];

	gl_Position = modelviewprojMat *  vec4(Position, 1.0);
	gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,vCoords[0]);
	EmitVertex();

	// 1
	Position.x = RFX2*Z*(X + XL - FX2);
	Position.y = RFY2*Z*(Y - FY2);
	Position.z = Z;
	gTexCoords.x = (U + UL)*UMult;
	gTexCoords.y = (V)*VMult;
	gDrawColor=vDrawColor[0];

	gl_Position = modelviewprojMat *  vec4(Position, 1.0);
	gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,vCoords[1]);
	EmitVertex();

	// 2
	Position.x = RFX2*Z*(X + XL - FX2);
	Position.y = RFY2*Z*(Y + YL - FY2);
	Position.z = Z;
	gTexCoords.x = (U + UL)*UMult;
	gTexCoords.y = (V + VL)*VMult;
	gDrawColor=vDrawColor[0];

	gl_Position = modelviewprojMat *  vec4(Position, 1.0);
	gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,vCoords[2]);
	EmitVertex();
	EndPrimitive();

	// 0
	Position.x = RFX2*Z*( X - FX2);
	Position.y = RFY2*Z*( Y - FY2);
	Position.z = Z;
	gTexCoords.x = (U)*UMult;
	gTexCoords.y = (V)*VMult;
	gDrawColor=vDrawColor[0];

	gl_Position = modelviewprojMat *  vec4(Position, 1.0);
	gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,vCoords[0]);
	EmitVertex();

	// 2
	Position.x = RFX2*Z*(X + XL - FX2);
	Position.y = RFY2*Z*(Y + YL - FY2);
	Position.z = Z;
	gTexCoords.x = (U + UL)*UMult;
	gTexCoords.y = (V + VL)*VMult;
	gDrawColor=vDrawColor[0];

	gl_Position = modelviewprojMat *  vec4(Position, 1.0);
	gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,vCoords[1]);
	EmitVertex();

	// 3
	Position.x = RFX2*Z*(X - FX2);
	Position.y = RFY2*Z*(Y + YL - FY2);
	Position.z = Z;
	gTexCoords.x = (U)*UMult;
	gTexCoords.y = (V + VL)*VMult;
	gDrawColor=vDrawColor[0];

	gl_Position = modelviewprojMat *  vec4(Position, 1.0);
	gl_ClipDistance[ClipIndex] = PlaneDot(ClipPlane,vCoords[2]);
	EmitVertex();

	EndPrimitive();
}
