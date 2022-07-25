/*=============================================================================
	Fragmentshader for DrawTile.

	Revision history:
		* Created by Smirftsch
=============================================================================*/

uniform uint PolyFlags;
uniform bool bHitTesting;
uniform float Gamma;
uniform vec4 HitDrawColor;

in vec2 gTexCoords;
flat in vec4 gDrawColor;
flat in uint gTexNum;

#if BINDLESSTEXTURES
layout(std140) uniform TextureHandles
{
	sampler2D Textures[NUMTEXTURES];
};
#endif

uniform sampler2D Texture0;

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
	vec4 TotalColor;
	vec4 Color;

    #if BINDLESSTEXTURES
    if (gTexNum > 0u)
        Color = texture(Textures[gTexNum], gTexCoords);
    else Color = texture(Texture0, gTexCoords);
    #else
    Color = texture(Texture0, gTexCoords);
    #endif

    #if SRGB
    if((PolyFlags & PF_Modulated)!=PF_Modulated)
	{
		Color.r=max(1.055 * pow(Color.r, 0.416666667) - 0.055, 0.0);
		Color.g=max(1.055 * pow(Color.g, 0.416666667) - 0.055, 0.0);
        Color.b=max(1.055 * pow(Color.b, 0.416666667) - 0.055, 0.0);
    }
    #endif

	// Handle PF_Masked.
	if ( (PolyFlags&PF_Masked) == PF_Masked )
	{
		if(Color.a < 0.5)
			discard;
		else Color.rgb /= Color.a;
	}
	else if ( (PolyFlags&PF_AlphaBlend) == PF_AlphaBlend && Color.a < 0.01 )
		discard;

	TotalColor = Color * gDrawColor; // Add DrawColor.

	if((PolyFlags & PF_Modulated)!=PF_Modulated)
	{
#if EDITOR
        // Gamma
        float InGamma = Gamma*GammaMultiplierUED;
        TotalColor.r=pow(TotalColor.r,1.0/InGamma);
        TotalColor.g=pow(TotalColor.g,1.0/InGamma);
        TotalColor.b=pow(TotalColor.b,1.0/InGamma);
#else
		// Gamma
		float InGamma = Gamma*GammaMultiplier; // Gamma is a value from 0.1 to 1.0
        TotalColor.r=pow(TotalColor.r,1.0/InGamma);
        TotalColor.g=pow(TotalColor.g,1.0/InGamma);
        TotalColor.b=pow(TotalColor.b,1.0/InGamma);
#endif
	}

#if EDITOR
	// Editor support.
	if ( (PolyFlags&PF_Selected) == PF_Selected )
	{
        TotalColor.g = TotalColor.g - 0.04;
		TotalColor = clamp(TotalColor,0.0,1.0);
	}

	// HitSelection, Zoneview etc.
	if (bHitTesting)
		TotalColor = HitDrawColor; // Use HitDrawColor.
#endif

# if SIMULATEMULTIPASS
	FragColor	= TotalColor;
	FragColor1	= vec4(1.0,1.0,1.0,1.0)-TotalColor;
#else
    FragColor	= TotalColor;
#endif
}
