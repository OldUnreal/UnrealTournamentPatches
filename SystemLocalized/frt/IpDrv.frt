[Public]
Object=(Name=IpDrv.UpdateServerCommandlet,Class=Class,MetaClass=Core.Commandlet)
Object=(Name=IpDrv.MasterServerCommandlet,Class=Class,MetaClass=Core.Commandlet)
Object=(Name=IpDrv.CompressCommandlet,Class=Class,MetaClass=Core.Commandlet)
Object=(Name=IpDrv.DecompressCommandlet,Class=Class,MetaClass=Core.Commandlet)
Object=(Name=IpDrv.TcpNetDriver,Class=Class,MetaClass=Engine.NetDriver)
Object=(Name=IpDrv.UdpBeacon,Class=Class,MetaClass=Engine.Actor)
Preferences=(Caption="TCP/IP Network Play",Parent="Networking",Class=IpDrv.TcpNetDriver)
Preferences=(Caption="Server Beacon",Parent="Networking",Class=IpDrv.UdpBeacon,Immediate=True)

[UpdateServerCommandlet]
HelpCmd=updateserver
HelpWebLink="https://www.oldunreal.com/wiki/index.php?title=Commandlet"
; EN: HelpOneLiner="Service Unreal Engine auto update requests."
HelpOneLiner="Service de mise à jour automatique sur requète."
; EN: HelpUsage="updateserver [-option...] [parm=value]"
HelpUsage="updateserver [-option ...] [parm=valeur]"
HelpParm[0]="ConfigFile"
; EN: HelpDesc[0]="Configuration file to use. Default: UpdateServer.ini."
HelpDesc[0]="Fichier de configuration à utiliser. Par défaut: UpdateServer.ini."

[MasterServerCommandlet]
HelpCmd=masterserver
HelpWebLink="https://www.oldunreal.com/wiki/index.php?title=Commandlet"
; EN: HelpOneLiner="Maintain master list of servers."
HelpOneLiner="Liste de serveurs maîtres."
; EN: HelpUsage="masterserver [-option...] [parm=value]"
HelpUsage="masterserver [-option ...] [parm=valeur]"
HelpParm[0]="ConfigFile"
; EN: HelpDesc[0]="Configuration file to use. Default: MasterServer.ini."
HelpDesc[0]="Fichier de configuration à utiliser. Par défaut: MasterServer.ini."

[CompressCommandlet]
HelpCmd=compress
HelpWebLink="https://www.oldunreal.com/wiki/index.php?title=Commandlet"
; EN: HelpOneLiner="Compress an Unreal package for auto-downloading. A file with extension .uz will be created."
HelpOneLiner="Compresse un package d'Unreal pour en permettre le téléchargement automarique. Un fichier .uz sera créé."
; EN: HelpUsage="compress File1 [File2 [File3 ...]]"
HelpUsage="compress Fichier1 [fichier2 [fichier3 ...]]"
; EN: HelpParm[0]="Files"
HelpParm[0]="Fichiers"
; EN: HelpDesc[0]="The wildcard or file names to compress."
HelpDesc[0]="Fichiers à compresser."

[DecompressCommandlet]
HelpCmd=decompress
HelpWebLink="https://www.oldunreal.com/wiki/index.php?title=Commandlet"
; EN: HelpOneLiner="Decompress a file compressed with ucc compress."
HelpOneLiner="Décompresser un fichier par commande de compression ucc."
; EN: HelpUsage="decompress CompressedFile"
HelpUsage="décompresser CompressedFile"
; EN: HelpParm[0]="CompressedFile"
HelpParm[0]="CompressedFile"
; EN: HelpDesc[0]="The .uz file to decompress."
HelpDesc[0]="Fichier .uz à décompresser."

[TcpNetDriver]
; EN: ClassCaption="TCP/IP Network Play"
ClassCaption="Partie en réseau TCP/IP"

[UdpBeacon]
; EN: ClassCaption="Server LAN Beacon"
ClassCaption="Balise serveur réseau local"
