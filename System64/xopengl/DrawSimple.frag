/*=============================================================================
	Fragmentshader for DrawSimple, line drawing.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

uniform vec4 DrawColor;
uniform uint LineFlags;
uniform bool bHitTesting;
uniform float Gamma;

#ifdef GL_ES
layout ( location = 0 ) out vec4 FragColor;
# if SIMULATEMULTIPASS
layout ( location = 1 ) out vec4 FragColor1;
#endif
#else
# if SIMULATEMULTIPASS
layout ( location = 0, index = 1) out vec4 FragColor1;
#endif
layout ( location = 0, index = 0) out vec4 FragColor;
#endif

void main(void)
{
    vec4 TotalColor = DrawColor;

	if ( (LineFlags&LINE_Transparent)==LINE_Transparent )
	{
	// stijn: this is an attempt at stippled line drawing in GL4
//        if (((uint(floor(gl_FragCoord.x)) & 1u) ^ (uint(floor(gl_FragCoord.y)) & 1u)) == 0u)
//            discard;
	}
#if EDITOR
        if (!bHitTesting)
        {
            // Gamma
            float InGamma = Gamma*GammaMultiplierUED;
            TotalColor.r=pow(TotalColor.r,1.0/InGamma);
            TotalColor.g=pow(TotalColor.g,1.0/InGamma);
            TotalColor.b=pow(TotalColor.b,1.0/InGamma);
        }
#else
		// Gamma
		float InGamma = Gamma*GammaMultiplier;
        TotalColor.r=pow(TotalColor.r,1.0/InGamma);
        TotalColor.g=pow(TotalColor.g,1.0/InGamma);
        TotalColor.b=pow(TotalColor.b,1.0/InGamma);
#endif

#if SIMULATEMULTIPASS
    FragColor1	= vec4(1.0,1.0,1.0,1.0)-TotalColor;
#endif
	FragColor = TotalColor;
}
