[Public]
Class=(Class=WinDrv.WindowsClient,SuperClass=Engine.Client,Compat="Win32,Win64")
Preferences=(Caption="Windows",Parent="Display",Class=WinDrv.WindowsClient,Immediate=True,Category=Display)
Preferences=(Caption="Windows",Parent="Joystick",Class=WinDrv.WindowsClient,Immediate=True,Category=Joystick)

[Errors]
; EN: Failed3D="3D hardware initialization failed"
Failed3D="Echec d'initialisation de la fenêtre 3D"
; EN: DDrawMode="DirectDraw was unable to set the requested video mode."
DDrawMode="DirectDraw n'a pas réussi à définir le mode d'affichage demandé."

[General]
; EN: ViewPersp="Perspective map"
ViewPersp="Carte en perspective"
; EN: ViewXY="Overhead map"
ViewXY="Carte aérienne"
; EN: ViewXZ="XZ map"
ViewXZ="Carte XZ"
; EN: ViewYZ="YZ map"
ViewYZ="Carte YZ"
; EN: ViewOther="Viewport"
ViewOther="Point de Vue"
; EN: Color16="&16-bit color"
Color16="Couleurs &16 bits"
; EN: Color32="&32-bit color"
Color32="Couleurs &32 bits"
; EN: AdvancedOptions="Advanced Options"
AdvancedOptions="Options Avancées"

[WindowsClient]
; EN: ClassCaption="Standard Windows Manager"
ClassCaption="Gestionnaire Windows standard"
