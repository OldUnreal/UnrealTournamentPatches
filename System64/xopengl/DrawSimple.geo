layout(lines) in;
layout(line_strip, max_vertices = 2) out;

noperspective out float texCoord;

void main()
{
    mat4 modelviewMat = modelMat * viewMat;
	vec2 winPos1 = vec2(512,384) * gl_in[0].gl_Position.xy / gl_in[0].gl_Position.w;
	vec2 winPos2 = vec2(512,384) * gl_in[1].gl_Position.xy / gl_in[1].gl_Position.w;

	// Line Start
	gl_Position = modelviewprojMat * (gl_in[0].gl_Position);
	texCoord = 0.0;
	EmitVertex();

	// Line End
	gl_Position = modelviewprojMat * (gl_in[1].gl_Position);
	texCoord = length( winPos2 - winPos1 );
	EmitVertex();
	EndPrimitive();
}
