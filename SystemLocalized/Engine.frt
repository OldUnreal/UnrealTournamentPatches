[Public]
Object=(Name=Engine.Console,Class=Class,MetaClass=Engine.Console)
Preferences=(Caption="Avancées",Parent="Options avancées")
Preferences=(Caption="Paramètres du moteur du jeu",Parent="Avancées",Class=Engine.GameEngine,Category=Settings,Immediate=True)
Preferences=(Caption="Alias clés",Parent="Avancées",Class=Engine.Input,Immediate=True,Category=Aliases)
Preferences=(Caption="Liaisons clés",Parent="Avancées",Class=Engine.Input,Immediate=True,Category=RawKeys)
Preferences=(Caption="Pilotes",Parent="Options avancées",Class=Engine.Engine,Immediate=False,Category=Drivers)
Preferences=(Caption="Informations serveur public",Parent="Réseau",Class=Engine.GameReplicationInfo,Immediate=True)
Preferences=(Caption="Réglages du jeu",Parent="Options avancées",Class=Engine.GameInfo,Immediate=True)

[Errors]
NetOpen=Erreur d'ouverture de fichier
NetWrite=Erreur d'écriture dans un fichier 
NetRefused=Le serveur a refusé d'envoyer '%s'
NetClose=Erreur de fermeture de fichier
NetSize=Différence de taille de fichier
NetMove=Erreur de déplacement de fichier 
NetInvalid=Réception d'une demande de fichier non valide
NoDownload=Le package '%s' n'est pas téléchargeable
DownloadFailed=Echec du téléchargement du package '%s' : %s
RequestDenied=Le serveur a demandé un fichier en état d'attente : refusé
ConnectionFailed=Echec de connexion
ChAllocate=Impossible d'allouer une chaîne
NetAlready=Déjà en réseau
NetListen=Echec d'écoute : Aucun contexte de liaison disponible 
LoadEntry=Impossible de charger l'entrée : %s 
InvalidUrl=URL non valide : %s 
InvalidLink=Lien non valide : %s
FailedBrowse=Impossible d'entrer %s: %s
Listen=Echec d'écoute : %s
AbortToEntry=Echec; retour à Entrée 
ServerOpen=Les serveurs ne réussissent pas à ouvrir les URLs réseau
ServerListen=Le serveur dédié n'arrive pas à écouter : %s
Pending=Echec de connexion à '%s' ; %s 
LoadPlayerClass=Echec de chargement de la classe du joueur
ServerOutdated=La version du serveur est ancienne

[Progress]
RunningNet=%s: %s (%i joueur)
NetReceiving=Réception de '%s': %i/%i
NetReceiveOk=Réception réussie de '%s'
NetSend=Envoi '%s'
NetSending=Envoi '%s': %i/%i
Connecting=Connexion...
Listening=Ecoute des clients...
Loading=Chargement
Saving=Enregistrement
Paused=Interrompu par %s
ReceiveFile=Réception de '%s' (F10 pour annuler)
ReceiveSize=Taille %iK, Total %3.1f%%
ConnectingText=Connexion (F10 pour annuler):
ConnectingURL=unreal://%s/%s

[Console]
ClassCaption=Console Unreal standard
LoadingMessage=CHARGEMENT
SavingMessage=ENREGISTREMENT
ConnectingMessage=CONNEXION
PausedMessage=INTERROMPU
PrecachingMessage=MISE EN MEMOIRE CACHE PROVISOIRE
ChatChannel=(MESSAGE) 
TeamChannel=(EQUIPE) 

[General]
Upgrade=Pour accéder à ce serveur, vous devez vous procurer la dernière mise à jour gratuite de Unreal sur le site Web de Epic :
UpgradeURL=http://www.unreal.com/upgrade
UpgradeQuestion=Souhaitez-vous démarrer maintenant votre explorateur Web et afficher la page des mises à jour ?
Version=Version %i

[Menu]
HelpMessage=
MenuList=
LeftString=Gauche
RightString=Droite
CenterString=Centre
EnabledString=Activé
DisabledString=Désactivé 
HelpMessage[1]="Ce menu n'a pas encore été introduit."
YesString=oui
NoString=non

[Inventory]
PickupMessage=Récupéré un élément
M_Activated=" activé"
M_Selected=" sélectionné"
M_Deactivated=" désactivé"
ItemArticle=a

[WarpZoneInfo]
OtherSideURL=

[GameInfo]
SwitchLevelMessage=Changement de niveaux
DefaultPlayerName=Joueur
LeftMessage=" a quitté la partie."
FailedSpawnMessage=N'a pas réussi à générer un acteur joueur
FailedPlaceMessage=N'a pas trouvé de point de démarrage (le niveau nécessite peut-être un acteur 'PlayerStart')
NameChangedMessage=Nom changé en... 
EnteredMessage=" a rejoint la partie."
GameName=Partie
MaxedOutMessage=Le serveur a déjà atteint sa capacité maximale.
WrongPassword=Le mot de passe que vous avez entré n'est pas valide.
NeedPassword="Vous devez entrer un mot de passe pour rejoindre cette partie."
FailedTeamMessage=Impossible de trouver l'équipe du joueur 

[LevelInfo]
Title=Sans titre

[Weapon]
MessageNoAmmo=" est sans munitions."
PickupMessage=Vous avez une arme 
DeathMessage=%o a été tué par %w de %k.
ItemName=Arme
DeathMessage[0]=%o a été tué par %w de %k.
DeathMessage[1]=%o a été tué par %w de %k.
DeathMessage[2]=%o a été tué par %w de %k.
DeathMessage[3]=%o a été tué par %w de %k.

[Counter]
CountMessage=Plus que %i...
CompleteMessage=Terminé !

[Ammo]
PickupMessage=Vous avez récupéré des munitions.

[Pickup]
ExpireMessage=

[SpecialEvent]
DamageString=

[DamageType]
Name=tué
AltName=tué 

[PlayerPawn]
QuickSaveString=Enregistrement rapide
NoPauseMessage=Impossible de mettre la partie en pause
ViewingFrom=Affichage en cours
OwnCamera=caméra personnelle
FailedView=Echec de changement d'affichage.
CantChangeNameMsg=Vous ne pouvez pas changer de nom lors d'une partie en réseau.

[Pawn]
NameArticle=" a "

[Spectator]
MenuName=Spectateur