[Public]
Object=(Name=SDLGLDrv.SDLGLRenderDevice,Class=Class,MetaClass=Engine.RenderDevice,Autodetect=libGL.so.1)
Preferences=(Caption="SDL OpenGL",Parent="Rendering",Class=SDLGLDrv.SDLGLRenderDevice,Immediate=True)

[Errors]
; EN: NoFindGL="Can't find OpenGL driver %ls"
NoFindGL="Impossible de trouver le driver OpenGL suivant: %ls"
; EN: MissingFunc="Missing OpenGL function %ls (%i)"
MissingFunc="Fonction OpenGL Manquante: %ls (%i)"
; EN: ResFailed="Failed to set resolution"
ResFailed="Impossible de changer la résolution"

[SDLGLRenderDevice]
; EN: ClassCaption="SDL OpenGL"
ClassCaption="SDL OpenGL"
; EN: AskUse="Do you want Unreal Tournament to use your SDL OpenGL rendering device?"
AskUse="Souhaitez-vous qu'Unreal Tournament utilise votre carte SDL OpenGL?"
