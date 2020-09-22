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
in vec4 gDrawColor;
flat in uint gTexNum;
out vec4 FragColor;

uniform sampler2D Texture0;

void main(void)
{
	vec4 TotalColor;
	vec4 Color;

    #ifdef BINDLESSTEXTURES
    if (gTexNum > 0u)
        Color = texture(Textures[gTexNum], gTexCoords);
    else Color = texture(Texture0, gTexCoords);
    #else
    Color = texture(Texture0, gTexCoords);
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
		// Gamma
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
	}

#ifdef EDITOR
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

	FragColor = TotalColor;
}
