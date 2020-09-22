/*=============================================================================
	Fragmentshader for DrawSimple, line drawing.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

uniform vec4 DrawColor;
uniform uint LineFlags;
uniform bool bHitTesting;
uniform float Gamma;

in float texCoord;

// LineFlags
const uint LINE_None			= 0x00u;
const uint LINE_Transparent		= 0x01u;
const uint LINE_DepthCued	 	= 0x02u;

out vec4 FragColor;

void main(void)
{
    vec4 TotalColor = DrawColor;

    if (bHitTesting)
        TotalColor = DrawColor; // Use (still) DrawColor. Maybe needed later. Nonsense now.

	if ( (LineFlags&LINE_Transparent)==LINE_Transparent )
	{
	}
#ifndef EDITOR
	#ifdef GL_ES
			// 1.055*pow(x,(1.0 / 2.4) ) - 0.055
			// FixMe: ugly rough srgb to linear conversion.
			TotalColor.r=(1.055*pow(TotalColor.r,(1.0-Gamma / 2.4))-0.055);
			TotalColor.g=(1.055*pow(TotalColor.g,(1.0-Gamma / 2.4))-0.055);
			TotalColor.b=(1.055*pow(TotalColor.b,(1.0-Gamma / 2.4))-0.055);
	#else
			TotalColor.r=pow(TotalColor.r,2.7-Gamma*1.7);
			TotalColor.g=pow(TotalColor.g,2.7-Gamma*1.7);
			TotalColor.b=pow(TotalColor.b,2.7-Gamma*1.7);
	#endif
#endif
	FragColor = TotalColor;
}
