[Public]
Object=(Name=OpenGLDrv.OpenGLRenderDevice,Class=Class,MetaClass=Engine.RenderDevice,Autodetect=)
Preferences=(Caption="Rendu",Parent="Options avancées")
Preferences=(Caption="Support OpenGL",Parent="Rendu",Class=OpenGLDrv.OpenGLRenderDevice,Immediate=True)

[OpenGLRenderDevice]
ClassCaption="Support OpenGL Tim"
AskInstalled=Est-ce qu'une carte accélératrice 3D compatible OpenGL est installée sur votre système ? 
AskUse=Souhaitez-vous qu'Unreal utilise votre carte accélératrice OpenGL ?

[Errors]
NoFindGL=Pilote %s OpenGL introuvable 
MissingFunc=Fonction %s (%i) OpenGL manquante
ResFailed=Echec du réglage de la résolution
