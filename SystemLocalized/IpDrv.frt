[Public]
Object=(Name=IpDrv.TcpNetDriver,Class=Class,MetaClass=Engine.NetDriver)
Object=(Name=IpDrv.UdpBeacon,Class=Class,MetaClass=Engine.Actor)
Preferences=(Caption="Réseau",Parent="Options avancées")
Preferences=(Caption="Partie en réseau TCP/IP",Parent="Réseau",Class=IpDrv.TcpNetDriver)
Preferences=(Caption="Balise de serveur",Parent="Réseau",Class=IpDrv.UdpBeacon,Immediate=True)

[TcpNetDriver]
ClassCaption="Partie en réseau TCP/IP"

[UdpBeacon]
ClassCaption="Balise serveur réseau local"

