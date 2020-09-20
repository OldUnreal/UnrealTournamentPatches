[Public]
Object=(Name=UnrealI.DarkMatch,Class=Class,MetaClass=Engine.GameInfo)
Object=(Name=UnrealI.KingOfTheHill,Class=Class,MetaClass=Engine.GameInfo)
Object=(Name=Unreali.FlakCannon,Class=Class,MetaClass=Engine.Weapon)
Object=(Name=Unreali.GESBioRifle,Class=Class,MetaClass=Engine.Weapon)
Object=(Name=Unreali.Razorjack,Class=Class,MetaClass=Engine.Weapon)
Object=(Name=Unreali.Rifle,Class=Class,MetaClass=Engine.Weapon)
Object=(Name=Unreali.Minigun,Class=Class,MetaClass=Engine.Weapon)
Object=(Name=Unreali.FemaleTwo,Class=Class,MetaClass=UnrealShare.UnrealiPlayer,Description="Femme 2")
Object=(Name=Unreali.MaleOne,Class=Class,MetaClass=UnrealShare.UnrealiPlayer,Description="Homme 1")
Object=(Name=Unreali.MaleTwo,Class=Class,MetaClass=UnrealShare.UnrealiPlayer,Description="Homme 2")
Object=(Name=Unreali.SkaarjPlayer,Class=Class,MetaClass=UnrealShare.UnrealiPlayer,Description="Skaarj")
Object=(Name=Unreali.FemaleTwoBot,Class=Class,MetaClass=UnrealShare.Bots,Description="Femme 2")
Object=(Name=Unreali.MaleOneBot,Class=Class,MetaClass=UnrealShare.Bots,Description="Homme 1")
Object=(Name=Unreali.MaleTwoBot,Class=Class,MetaClass=UnrealShare.Bots,Description="Homme 2")
Object=(Name=Unreali.SkaarjPlayerBot,Class=Class,MetaClass=UnrealShare.Bots,Description="Skaarj")
Preferences=(Caption="Types de partie",Parent="Options avancées")
Preferences=(Caption="Match noir",Parent="Types de partie",Class=UnrealI.DarkMatch,Immediate=True)
Preferences=(Caption="Maître du monde",Parent="Types de partie",Class=UnrealI.KingOfTheHill,Immediate=True)
Preferences=(Caption="Réseau",Parent="Options avancées")
Preferences=(Caption="Listes de cartes",Parent="Réseau")
Preferences=(Caption="Cartes matchs noirs",Parent="Listes de cartes",Class=UnrealI.DkMapList,Immediate=True)

[DeathmatchGame]
ClassCaption="Match à mort"
GlobalNameChange= a changé son nom en 
NoNameChange= est déjà en cours d'utilisation
MaxedOutMessage=Le serveur est déjà en pleine capacité 
GameName=Match à mort

[DarkMatch]
GameName=Match noir

[KingOfTheHill]
ClassCaption=Maître du monde
KingMessage=" est le nouveau maître du monde !"
GameName=Maître du monde

[TeamGame]
ClassCaption=Partie par équipe
NewTeamMessage= a rejoint
TeamColor[0]=Rouge
TeamColor[1]=Bleu
TeamColor[2]=Vert
TeamColor[3]=Or
GameName=Partie par équipe

[CoopGame]
ClassCaption=Mode coopératif
GameName=Coopératif

[UnrealGameInfo]
DeathVerb=" a été "
DeathPrep=" par "
DeathTerm=tué
DeathArticle=un(e) 
ExplodeMessage= a explosé
SuicideMessage= a fait un infarctus.
FallMessage= a laissé un petit cratère.
DrownedMessage= a oublié de respirer à la surface.
BurnedMessage= a été incinéré
CorrodedMessage= a été englué
HackedMessage= a été taillé en pièces
DeathMessage[0]=tué
DeathMessage[1]=gagné
DeathMessage[2]=fumé
DeathMessage[3]=dépecé
DeathMessage[4]=annihilé
DeathMessage[5]=descendu
DeathMessage[6]=écrémé
DeathMessage[7]=perforé
DeathMessage[8]=déchiqueté
DeathMessage[9]=détruit
DeathMessage[10]=ridiculisé
DeathMessage[11]=mis aux ordures
DeathMessage[12]=exterminé
DeathMessage[13]=écrasé
DeathMessage[14]=anéanti
DeathMessage[15]=broyé
DeathMessage[16]=battu
DeathMessage[17]=écrabouillé
DeathMessage[18]=réduit à l'état de purée
DeathMessage[19]=tranché
DeathMessage[20]=coupé en morceaux
DeathMessage[21]=éventré
DeathMessage[22]=explosé
DeathMessage[23]=déchiré
DeathMessage[24]=fessé
DeathMessage[25]=éviscéré
DeathMessage[26]=neutralisé
DeathMessage[27]=fouetté
DeathMessage[28]=roulé
DeathMessage[29]=recyclé
DeathMessage[30]=crevé
DeathMessage[31]=tronçonné
DeathModifier[0]=entièrement    
DeathModifier[1]=complètement    
DeathModifier[2]=absolument    
DeathModifier[3]=totalement    
DeathModifier[4]=définitivement 
MajorDeathMessage[0]=éventré un autre
MajorDeathMessage[1]=fait du dégât
MajorDeathMessage[2]=redéfini le concept de douleur
MajorDeathMessage[3]=
MajorDeathMessage[4]=
MajorDeathMessage[5]=
MajorDeathMessage[6]=
MajorDeathMessage[7]=
HeadLossMessage[0]=décapité
HeadLossMessage[1]=étêté 

[UnrealQuitMenu]
YesSelString= [OUI]  Non
NoSelString=  Oui  [NON]
MenuTitle=Quitter ?
HelpMessage[1]=Sélectionnez Oui et appuyez sur Entrée pour retrouver la fadeur et l'inutilité de votre existence, puisque vous n'avez pas l'étoffe d'UNREAL.
MenuList[0]=Digital Extremes/Epic Megagames
MenuList[1]=Collaboration
MenuList[2]=Conception : James Schmalz
MenuList[3]=Cliff Bleszinski
MenuList[4]=Niveaux : Cliff Bleszinski
MenuList[5]=T. Elliot Cannon  Pancho Eekels
MenuList[6]="Jeremy War  Cedric Fiorentino"
MenuList[7]=Shane Caudle
MenuList[8]=Anim. : Dave Carter
MenuList[9]=Info. : James Schmalz
MenuList[10]=Mike Leatham  Artur Bialas
MenuList[11]=Prog. : Tim Sweeney  Steven Polge
MenuList[12]=Erik de Neve  James Schmalz
MenuList[13]=Carlo Vogelsang  Nick Michon
MenuList[14]=Musique : Alex Brandon
MenuList[15]=Michiel van den Bos
MenuList[16]=Effets son. : Dave Ewing
MenuList[17]=Producteur GT : Jason Schreiber
MenuList[18]=Biz : M. Rein N. Kent C. Lafferty


[DispersionPistol]
PickupMessage=Vous avez le pistolet à dispersion 
ItemName=Pistolet à dispersion 

[UnrealGameOptionsMenu]
AdvancedString=Options avancées
AdvancedHelp=Modifiez les options de configuration avancées du jeu.
MenuTitle=OPTIONS DE JEU
HelpMessage[1]=Réglez la vitesse à laquelle passe le temps dans le jeu.
HelpMessage[2]=Avec l'option Vrai, vous réduisez l'aspect gore du jeu.
MenuList[1]=Vitesse de jeu
MenuList[2]=Moins de gore

[UnrealIndivBotMenu]
MenuTitle=Configuration intelligence artificielle
HelpMessage[1]=Type de configuration de Bot. Utilisez les touches gauche et droite pour changer.
HelpMessage[2]=Appuyez sur Entrée pour changer le nom de ce bot.
HelpMessage[3]=Utilisez les touches gauche et droite pour changer la classe de ce bot.
HelpMessage[4]= Utilisez les touches gauche et droite pour changer l'aspect de ce bot.
HelpMessage[5]=Réglez le niveau d'habileté générale de ce bot dans cette proportion (par rapport au niveau d'habileté de base des bots).
HelpMessage[6]=Indiquez dans quelle équipe joue ce bot (Rouge, Bleue, Verte ou Jaune).
MenuList[1]=Configuration
MenuList[2]=Nom
MenuList[3]=Classe
MenuList[4]=Aspect
MenuList[5]=Habileté
MenuList[6]=Equipe 

[IntroNullHud]
ESCMessage=Appuyez sur ECHAP pour commencer 

[UnrealFavoritesMenu]
MenuTitle=FAVORIS
EditList[0]=Nom du serveur :
EditList[1]=Adresse :
HelpMessage[1]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[2]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[3]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[4]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[5]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[6]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[7]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[8]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[9]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[10]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[11]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.
HelpMessage[12]=Appuyez sur Entrée pour accéder à ce serveur. Appuyez sur la touche de direction vers la droite pour modifier cette entrée.

[Translator]
PickupMessage=Appuyez sur F2 pour activer le Traducteur
NewMessage=Traducteur universel

[UnrealVideoMenu]
MenuTitle=AUDIO/VIDEO
HelpMessage[1]=Réglez le niveau de luminosité à l'aide des touches gauche et droite.
HelpMessage[2]=Afficher Unreal dans une fenêtre. Remarque : un mode d'affichage logiciel peut faire disparaître des détails visibles à l'aide de l'accélération graphique.
HelpMessage[3]= Sélectionnez la résolution à l'aide des touches gauche et droite, puis appuyez sur Entrée pour valider votre choix.
HelpMessage[4]=Définissez le paramètre "bas" pour optimiser l'exécution du jeu. Toute modification prendra effet au niveau suivant.
HelpMessage[5]=Réglez le volume musical à l'aide des touches gauche et droite.
HelpMessage[6]=Réglez le volume des effets sonores à l'aide des touches gauche et droite.
HelpMessage[7]=Définissez l'option "bas" pour optimiser l'exécution du jeu sur des machines ne disposant pas de plus de 32 Mo de RAM. Toute modification prendra effet au niveau suivant.
MenuList[1]=Luminosité 
MenuList[2]=Mode Plein écran 
MenuList[3]=Résolution 
MenuList[4]=Détail des textures 
MenuList[5]=Volume Musique 
MenuList[6]=Volume Son 
MenuList[7]=Qualité audio 
LowText=Bas
HighText=Haut
HelpMessage[8]=Avec l'option vrai, vous entendrez des messages dans les types de partie qui mettent en scène ces messages.
MenuList[8]=Messages


[UnrealMeshMenu]
HelpMessage[4]=Changez votre classe à l'aide des touches gauche et droite.
HelpMessage[5]=Entrez le mot de passe admin ici, ou le mot de passe du jeu si nécessaire.
MenuList[4]=Classe :
MenuList[5]=Mot de passe :
HelpMessage[6]=Appuyez sur Entrée pour commencer la partie.
MenuList[6]=Démarrer la partie 

[UnrealPlayerMenu]
MenuTitle=Sélectionner représentation numérique
HelpMessage[1]=Appuyez sur Entrée pour taper votre nom. Veillez à le faire avant de rejoindre une partie multijoueur.
HelpMessage[2]=Utilisez les touches de direction pour changer la couleur de votre équipe (Rouge, Bleu, Vert ou Jaune).
HelpMessage[3]=Modifiez votre apparence à l'aide des touches de direction gauche et droite.
MenuList[1]=Nom : 
MenuList[2]=Equipe :
MenuList[3]=Aspect :
HelpMessage[4]=Vous ne pouvez modifier votre classe/modèle qu'au moment où vous rejoignez une partie multijoueur ou lorsque vous commencez une nouvelle partie à un seul joueur.
MenuList[4]=Classe :

[UnrealJoinGameMenu]
InternetOption=Internet (28.8)
FastInternetOption= Internet rapide (RNIS, câble modem)
LANOption=RESEAU LOCAL 
MenuTitle=REJOINDRE UNE PARTIE 
HelpMessage[1]=Recherchez les serveurs locaux 
HelpMessage[2]=Choisissez un serveur dans la liste des favoris 
HelpMessage[3]=Appuyez sur Entrée pour taper une adresse de serveur. Appuyez à nouveau sur Entrée pour accéder à ce serveur.
HelpMessage[4]=Réglez la vitesse du réseau.
HelpMessage[5]=Ouvrez la page Web de la liste des serveurs Unreal Epic 
MenuList[1]=Trouvez les serveurs locaux 
MenuList[2]=Choisissez parmi les favoris 
MenuList[3]=Ouvrez 
MenuList[4]=Optimisé pour 
MenuList[5]=Accès liste serveurs Unreal Epic

[UnrealOptionsMenu]
MenuTitle=OPTIONS DU MENU
HelpMessage[1]=Activez ou désactivez aide de visée verticale.
HelpMessage[2]=Basculez l'activation du joystick.
HelpMessage[3]=Réglez la sensibilité de la souris, ou la distance que vous devez faire parcourir à la souris pour produire un mouvement donné dans le jeu.
HelpMessage[4]=Inversez l'axe X de la souris. Avec l'option Vrai, vous regarderez vers le bas plutôt que vers le haut si vous poussez la souris vers l'avant.
HelpMessage[5]=Avec l'option Vrai, la vue se centre automatiquement lorsque vous lâchez la touche VueSouris.
HelpMessage[6]=Avec l'option Vrai, la souris sert toujours à regarder en haut et en bas, sans nécessiter de touche VueSouris.
HelpMessage[7]= Avec l'option Vrai, la vue s'ajuste automatiquement pour regarder en haut et en bas lorsque vous n'êtes pas en mode VueSouris.
HelpMessage[8]=Avec l'option Vrai, votre écran se mettra à clignoter lorsque vous ferez feu.
HelpMessage[9]=Choisissez le réticule de visée qui sera affiché au centre de l'écran. 
HelpMessage[10]=Sélectionnez l'endroit de l'écran où apparaîtra votre arme.
HelpMessage[11]= Si activé, vous ferez un écart rapide en double-cliquant sur les touches de déplacement (avant, arrière, gauche et droite).
HelpMessage[12]=Appuyez sur Entrée pour personnaliser la configuration du clavier, de la souris et du joystick.
HelpMessage[13]=Appuyez sur Entrée pour établir l'ordre d'apparition des armes.
HelpMessage[14]=Utilisez les touches gauche et droite pour sélectionner une configuration Visualisation Tête Haute (HUD).
HelpMessage[15]=Réglez la quantité de mouvement de la caméra lorsque vous vous déplacez.
HelpMessage[16]=Ouvrez le menu de configuration des options avancées.
MenuList[1]=Visée automatique 
MenuList[2]=Joystick activé 
MenuList[3]=Sensib. souris 
MenuList[4]=Inverser souris 
MenuList[5]=VueAuto 
MenuList[6]=Toujours VueSouris 
MenuList[7]=Vue AutoHorizon 
MenuList[8]=Clignotement arme
MenuList[9]=Réticule 
MenuList[10]=Main armée 
MenuList[11]=Esquive 
MenuList[12]=Personnaliser les commandes 
MenuList[13]=Priorité des armes 
MenuList[14]=Configuration HUD 
MenuList[15]=Caméra à l'épaule 
MenuList[16]=Options avancées 

[EndgameHud]
Message1=La capsule d'évacuation Skaarj s'est libérée de l'attraction gravitationnelle de la planète... Quelle victoire ! Cependant, vous n'avez presque plus de carburant et vous dérivez dans l'espace...
Message2=Vous avez réussi à vous échapper de là où tant y ont laissé la vie. Vous riez intérieurement. Il s'est passé tant de choses, mais rien n'a changé.
Message3=Avant de vous écraser sur la planète, vous étiez enfermé dans une cellule et vous voilà à nouveau confiné dans une prison.
Message4=Mais vous gardez l'espoir que quelqu'un vous repérera dans votre petit vaisseau... un jour.
Message5=En attendant, vous dérivez et continuez à espérer.
Message6=A suivre...

[UnrealWeaponMenu]
MenuTitle=PRIORITES

[Eightball]
PickupMessage=Vous avez le lanceur 8 coups 
ItemName=Lanceur 8 coups 

[UnrealKeyboardMenu]
OrString= ou 
MenuTitle=COMMANDES 
HelpMessage[1]=
MenuList[1]=Tirer 
MenuList[2]=Alterner tir 
MenuList[3]=Avancer 
MenuList[4]=Reculer 
MenuList[5]=Tourner à gche 
MenuList[6]=Tourner à dte 
MenuList[7]=Mitrail. à gche 
MenuList[8]=Mitrail. à dte 
MenuList[9]=Sauter/Haut
MenuList[10]=Ramper/Bas 
MenuList[11]=Vue Souris
MenuList[12]=Activ. élément 
MenuList[13]=Elément suiv.
MenuList[14]=Elément préc.
MenuList[15]=Regarder haut 
MenuList[16]=Regarder bas 
MenuList[17]=Centrer vue 
MenuList[18]=Marcher 
MenuList[19]=Mitrailler 
MenuList[20]=Arme suivante 
MenuList[21]=REINITIALISER 

[TranslatorEvent]
M_NewMessage=Nouveau message du Traducteur 
M_TransMessage=Message du Traducteur 

[Flashlight]
ExpireMessage=Les piles de votre lampe torche sont épuisées.
PickupMessage=Vous avez récupéré la lampe torche 

[ParentBlob]
BlobKillMessage=a été endommagé par un Blob 

[FlakCannon]
PickupMessage=Vous avez le canon antiaérien 
ItemName=Canon antiaérien 

DeathMessage=%o a été coupé en morceaux par %k's %w.

[Rifle]
PickupMessage=Vous avez le fusil 
ItemName=Sniper 
DeathMessage=%k a tiré une balle dans le crâne de %o.

[UnrealBotConfigMenu]
MenuTitle=BOTS
HelpMessage[1]=Avec l'option Vrai, les bots adaptent leur niveau d'habileté en fonction de leur efficacité face aux joueurs.
HelpMessage[2]=Niveau d'habileté de base des bots (entre 0 et 3).
HelpMessage[3]=Avec l'option Vrai, les bots entrent dans la partie dans un ordre aléatoire. Avec l'option Faux, les bots entrent dans leur ordre de configuration.
HelpMessage[4]=Modifiez la configuration des bots voulus.
MenuList[1]=Auto-adapt. habileté 
MenuList[2]=Habileté de base 
MenuList[3]=Ordre aléatoire 
MenuList[4]=Configurer les bots 
HelpMessage[5]=Nombre de bots au début de la partie (max 15).
HelpMessage[6]=Utilisez les bots dans des parties contre d'autres personnes
MenuList[5]=Nombre de bots
MenuList[6]=Bots dans les parties 

[UnrealLoadMenu]
RestartString=Redémarrer 
MenuTitle=CHARGER UNE PARTIE 

[UnrealSlotMenu]
MonthNames[0]=Janv
MonthNames[1]=Fév
MonthNames[2]=Mars
MonthNames[3]=Avril
MonthNames[4]=Mai
MonthNames[5]=Juin
MonthNames[6]=Juil
MonthNames[7]=Août
MonthNames[8]=Sept
MonthNames[9]=Oct
MonthNames[10]=Nov
MonthNames[11]=Déc

[ASMD]
PickupMessage=Vous avez l'ASMD 
ItemName=ASMD 
[UnrealMainMenu]
HelpMessage[1]=Appuyez sur Entrée pour modifier les options de jeu, y compris le chargement et l'enregistrement des parties, le niveau de difficulté, et le démarrage d'un BotMatch.
HelpMessage[2]=Appuyez sur Entrée pour modifier les options de configuration multijoueur, y compris démarrer ou rejoindre une partie en réseau, changer d'aspect, de nom ou d'équipe.
HelpMessage[3]=Appuyez sur Entrée pour personnaliser les commandes.
HelpMessage[4]=Changez les options audio et vidéo 
HelpMessage[5]=Appuyez sur Entrée pour quitter.
HelpMessage[7]=Appelez le numéro gratuit (aux USA) 1-877-4UNREAL pour commander UNREAL !
MenuList[1]=PARTIE 
MenuList[2]=MULTIJOUEUR 
MenuList[3]=OPTIONS
MenuList[4]=AUDIO/VIDEO
MenuList[5]=QUITTER
MenuList[7]=INFOS COMMANDES 

[UnrealServerMenu]
BotTitle=BOTMATCH
MenuTitle=MULTIJOUEUR 
HelpMessage[1]=Choisir le type de partie.
HelpMessage[2]=Choisir la carte.
HelpMessage[3]=Modifier les options de jeu.
HelpMessage[4]=Démarrer la partie.
MenuList[1]=Sélect.partie 
MenuList[2]=Sélect. carte 
MenuList[3]=Configurer la partie 
MenuList[4]=Démarrer la partie 
MenuList[5]=Lancer le serveur dédié 
HelpMessage[5]=Démarrer un serveur dédié sur cette machine.

[UnrealGameMenu]
HelpMessage[1]=Appuyez sur Entrée pour enregistrer la partie en cours.
HelpMessage[2]=Appuyez sur Entrée pour charger la partie en cours.
HelpMessage[3]=Sélectionnez un niveau de difficulté et démarrez une nouvelle partie.
HelpMessage[4]=Appuyez sur Entrée pour modifier les options de jeu. Remarque : Vous ne pouvez le faire si vous jouez une partie multijoueur.
HelpMessage[5]=Match à mort contre les Bots.
MenuList[1]=ENREGISTRER UNE PARTIE 
MenuList[2]=CHARGER UNE PARTIE 
MenuList[3]=NOUVELLE PARTIE 
MenuList[4]=OPTIONS DE JEU 
MenuList[5]=BOTMATCH
[Health]
PickupMessage=Vous avez récupéré un kit médical +

[AutoMag]
PickupMessage=Vous avez l'AutoMag 
ItemName=Automag 

[UnrealChooseGameMenu]
MenuTitle=CHOISIR UNE PARTIE 
HelpMessage[1]=Choisissez une partie.
HelpMessage[2]=Choisissez une partie.
HelpMessage[3]=Choisissez une partie.
HelpMessage[4]=Choisissez une partie.
HelpMessage[5]=Choisissez une partie.
HelpMessage[6]=Choisissez une partie.
HelpMessage[7]=Choisissez une partie.
HelpMessage[8]=Choisissez une partie.
HelpMessage[9]=Choisissez une partie.
HelpMessage[10]=Choisissez une partie.
HelpMessage[11]=Choisissez une partie.
HelpMessage[12]=Choisissez une partie.
HelpMessage[13]=Choisissez une partie.
HelpMessage[14]=Choisissez une partie.
HelpMessage[15]=Choisissez une partie.
HelpMessage[16]=Choisissez une partie.
HelpMessage[17]=Choisissez une partie.
HelpMessage[18]=Choisissez une partie.
HelpMessage[19]=Choisissez une partie.

HelpMessage[1]=Rejoignez une partie en réseau.
HelpMessage[2]=Configurez et démarrez une partie en réseau.
HelpMessage[3]=Configurez votre apparence, nom et nom d'équipe.
MenuList[1]=REJOINDRE UNE PARTIE 
MenuList[2]=DEMARRER LA PARTIE 
MenuList[3]=CONFIG. JOUEUR 

[UnrealHelpMenu]
MenuTitle=AIDE
HelpMessage[1]=Ouvrez le document de dépannage.
MenuList[1]=Dépannage 

[YesNoMenu]
YesSelString=[OUI]  Non
NoSelString= Oui  [NON]

[NaliFruit]
PickupMessage=Vous avez cueilli le fruit de guérison Nali +

[Minigun]
PickupMessage=Vous avez le minigun 
ItemName=Minigun 
DeathMessage=%k's %w a fait de %o de la chair à pâté.

[UnrealListenMenu]
MenuTitle=SERVEURS LOCAUX
HelpMessage[1]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[2]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[3]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[4]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[5]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[6]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[7]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[8]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[9]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[10]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[11]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[12]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[13]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[14]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[15]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[16]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[17]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[18]=Appuyez sur Entrée pour sélectionner ce serveur.
HelpMessage[19]=Appuyez sur Entrée pour sélectionner ce serveur.

[GESBioRifle]
PickupMessage=Vous avez le fusil Bio GES 
ItemName=Fusil Bio GES 
DeathMessage=%o a absorbé une partie du liquide verdâtre de %k.

[UnrealDMGameOptionsMenu]
HelpMessage[3]=Nombre d'ennemis à abattre par le joueur pour remporter la partie. Si 0, pas de limite.
HelpMessage[4]=Durée (en minutes) de la partie. Si 0, pas de limite.
HelpMessage[5]=Nombre maximum de joueurs autorisés dans la partie.
HelpMessage[6]=Si le mode coopératif est activé, les armes ressurgissent automatiquement, mais ne peuvent être récupérées qu'une fois par un joueur donné.
HelpMessage[7]=Configurez une partie bot et des paramètres individuels.
HelpMessage[8]=Choisissez le style de jeu : Hardcore est plus rapide, et les armes sont plus dangereuses qu'en mode Classique. Turbo ressemble à Hardcore, avec des déplacements très rapides.
HelpMessage[9]=Messages de mort classiques ou d'un style nouveau (basé sur les armes).
MenuList[3]=Nombre d' ennemis
MenuList[4]=Durée
MenuList[5]=Joueurs max 
MenuList[6]=Garder armes
MenuList[7]=Configurer Bots
MenuList[8]=Mode Hardcore
MenuList[9]=Messages de mort
GameStyle[0]=Classique
GameStyle[1]=Hardcore
GameStyle[2]=Turbo

[Amplifier]
ExpireMessage=L'amplificateur n'a plus d'énergie.
PickupMessage=Vous avez l'amplificateur d'énergie

[SearchLight]
PickupMessage=Vous avez récupéré le projecteur.

[SCUBAGear]
PickupMessage=Vous avez récupéré le scaphandre 

[UnrealNewGameMenu]
HelpMessage[1]=Mode touriste.
HelpMessage[2]=Prêt à s'éclater !
HelpMessage[3]=Ne convient pas aux déficients coronariens.
HelpMessage[4]=Instinct suicidaire.
MenuList[1]=FACILE
MenuList[2]=MOYEN
MenuList[3]=DIFFICILE
MenuList[4]=IRREEL


[Stinger]
PickupMessage=Vous avez récupéré le stinger 
ItemName=Stinger

[RazorAmmo]
PickupMessage=Vous avez récupéré le lance-lames 

[RocketCan]
PickupMessage=Vous avez récupéré douze 8-coups 

[ShellBox]
PickupMessage=Vous avez récupéré 50 balles 

[VoiceBox]
PickupMessage=Vous avez récupéré la boîte vocale 

[UnrealSaveMenu]
CantSave=IMPOSSIBLE D'ENREGISTRER SI VOUS ETES MORT 
MenuTitle=ENREGISTRER UNE PARTIE 

[Seeds]
PickupMessage=Vous avez récupéré les graines de fruit Nali 

[RifleAmmo]
PickupMessage=Vous avez 8 cartouches de fusil.

[FlakBox]
PickupMessage=Vous avez récupéré 10 obus de canon antiaérien 

[Flare]
PickupMessage=Vous avez récupéré une fusée éclairante 

[JumpBoots]
ExpireMessage=Les bottes de saut ont cessé de fonctionner 
PickupMessage=Vous avez récupéré les bottes de saut 

[WeaponPowerUp]
PickupMessage=Vous avez récupéré la recharge du pistolet à dispersion 

[Razorjack]
PickupMessage="Vous avez le lance-lames" 
ItemName="Lance-lames" 
DeathMessage="%k a coupé un morceau sanglant de %o avec le %w."

[ForceField]
M M_NoRoom="Manque d'espace pour activer le champ de force".
PickupMessage= Vous avez récupéré le champ de force 

[ASMDAmmo]
PickupMessage=Vous avez récupéré un coeur ASMD.

[ShieldBelt]
PickupMessage=Vous avez récupéré la ceinture protectrice 

[UnrealTeamGameOptionsMenu]
HelpMessage[10]=Pourcentage de dommages encaissés lorsque vous êtes atteint par un tir ami. Remarque : vous prenez toujours la dose maximale de vos propres armes.
MenuList[10]=Echelle du tir ami 
HelpMessage[10]=Pourcentage de dommages encaissés lorsque vous êtes atteint par un tir ami. Remarque : vous prenez toujours la dose maximale de vos propres armes.
MenuList[10]=Echelle du tir ami 

[OKMenu]
OKString=[OK]

[StingerAmmo]
PickupMessage=Vous avez récupéré 40 éclats de Tarydium 

[UpgradeMenu]
MenuList[1]=Il vous faut une version de Unreal plus récente pour jouer sur ce serveur. Souhaitez-vous accéder au site Web de Unreal pour y récupérer une nouvelle version?

[Sludge]
PickupMessage=Vous avez récupéré 25 kilos de boue de Tarydium 

[Invisibility]
ExpireMessage=L'invisibilité a cessé de faire effet.
PickupMessage=Vous êtes invisible 

[ToxinSuit]
PickupMessage=Vous avez récupéré la combinaison anti-toxique 

[Shells]
PickupMessage=Vous avez récupéré 15 cartouches 

[RifleRound]
PickupMessage=Vous avez une cartouche de fusil.

[QuadShot]
PickupMessage=Vous avez récupéré le QuadShot 

[PowerShield]
PickupMessage= Vous avez récupéré le bouclier d'énergie 

[Dampener]
ExpireMessage=L'isolateur acoustique a cessé de faire effet.
PickupMessage=Vous avez récupéré l'isolateur acoustique 

[KevlarSuit]
PickupMessage=Vous avez récupéré la combinaison en kevlar 

[FlakShellAmmo]
PickupMessage=Vous avez récupéré un obus de canon antiaérien.

[Fell]
Name=est tombé 
AltName=est tombé 

[Drowned]
Name=s'est noyé 
AltName=s'est noyé 

[Decapitated]
Name=décapité 
AltName=étêté

[Corroded]
Name=endommagé 
AltName=englué 

[Clip]
PickupMessage=Vous avez récupéré une cartouche 

[Burned]
Name=rôti
AltName=brûlé vif 

[SuperHealth]
PickupMessage=Vous avez récupéré le super kit médical 

[Bandages]
PickupMessage=Vous avez récupéré des bandages +

[AsbestosSuit]
PickupMessage=Vous avez récupéré la combinaison en amiante 

[Armor]
PickupMessage=Vous avez récupéré la combinaison de combat 

[UnrealOrderMenu]
OrderText[0]=La version shareware de Unreal à laquelle vous venez de jouer n'est qu'un avant-goût de ce qui vous attend si vous achetez la version complète.
OrderText[1]=Aux Etats-Unis et au Canada, appelez gratuitement le numéro 1-877-4UNREAL  (1-877-486-7325) pour commander Unreal MAINTENANT.
OrderText[2]=Avec la version complète de Unreal, vous aurez :
OrderText[3]=- Plus de 30 niveaux incroyables pour les parties à un seul joueur 
OrderText[4]=- 11 cartes spécialement conçues pour les parties multijoueurs
OrderText[5]=- Les dix armes, avec 2 modes de tir et des mouvements spéciaux pour certains !  
OrderText[6]=- Plus de 30 créatures Unreal à rencontrer
OrderText[7]=- Découvrez une multitude de nouveaux objets d'inventaire 
OrderText[8]=- Plusieurs variétés de parties Bot Match à un seul joueur, sur réseau local et sur Internet : match noir, match à mort, maître du monde, partie par équipe et mode coopératif 
OrderText[9]=- 6 modèles de joueurs sont à votre disposition, ainsi qu'une grande diversité d'aspects.
OrderText[11]=Vous recevez également une version bêta fonctionnelle de l'éditeur Unreal :
OrderText[12]=- L'outil de conception de niveaux 3D le plus facile à utiliser !
OrderText[13]=- Utilise la géométrie dans l'espace ; construisez des pièces en découpant des blocs dans des formes solides 
OrderText[14]=- Permet aux utilisateurs d'importer leurs propres textures, leurs objets, leur musique et leurs effets sonores en utilisant des formats de fichiers tels que WAV, DXF, BMP etc.
OrderText[15]=- Créez vos propres cartes ou modifiez les cartes du jeu comme vous l'entendez 
OrderText[16]=- Comprend UnrealScript, le langage de programmation orienté objet intégré que nous avons utilisé lors de la création de la majorité du jeu Unreal.
OrderText[17]=- Distribuez librement vos cartes sur Internet pour les autres joueurs
OrderText[19]=Et vous aurez les possibilités de jeu complètes du serveur Unreal et d'Internet 
OrderText[20]=- Exécutez votre propre serveur dédié Unreal 
OrderText[21]=- Représentez un serveur non dédié en permettant aux autres de rejoindre une partie 
OrderText[22]=- Soyez l'hôte de vos propres niveaux Hall de Unreal grâce à des liens avec d'autres serveurs Unreal et avec des sites Web fonctionnant comme des pages Web 3D 
OrderText[23]=* la liaison Web à partir des niveaux Unreal nécessite, pour ceux qui accèdent au niveau, un navigateur Web supporté par Unreal.
OrderText[24]=Vous pouvez acheter Unreal chez votre détaillant local ou le commander directement chez Epic MegaGames. Voici comment passer votre commande chez Epic... 
OrderText[25]=Vous pouvez passer une commande et payer par carte de crédit directemement à partir de notre site Web, grâce à notre page de commandes sécurisée à l'adresse http://www.epicgames.com/UnrealOrders  
OrderText[26]=Etats-Unis / Canada
OrderText[27]=Unreal coûte 39.95 dollars américains (port et emballage compris) 
OrderText[29]=Vous pouvez également commander à partir de notre page de commande sécurisée à l'adresse http://www.epicgames.com/UnrealOrders
OrderText[30]=Royaume-Uni et Europe 
OrderText[32]=Autres pays
OrderText[34]=Nos partenaires en ligne
OrderText[35]=Rendez visite aux sites Web et aux serveurs de jeu Unreal offerts par ces importants partenaires en ligne :
OrderText[37]=Des gens qui vont donner encore plus d'intérêt à Unreal.
OrderText[38]=WON.NET - Le World Opponent Network est la façon la plus facile de sauter à pieds joints dans un match à mort Unreal GRATUIT sur Internet. Avec IE4.0 ou Netscape 4.0, il vous suffit d'appuyer sur un bouton pour bénéficier de l'option de victimes GRATUITES à l'adresse http://www.won.net/unreal.
OrderText[39]=Rejoignez la communauté Unreal dans des compétitions de création de niveaux, des panneaux d'informations, des liens, des délais ping courts, de nouveaux aspects et niveaux et un jeu en ligne GRATUIT... c'est Unreal sur WON.
OrderText[41]=Wireplay opère actuellement en Europe et en Australie. Pour plus d'informations, rendez visite à notre site Web à l'adresse http:// www.wireplay.com/uk/unreal
OrderText[43]=http://www.heat.net, vous allez vous faire tabasser gratuitement sur Internet.
OrderText[44]=AT&T WorldNet - Jouez à Unreal sur le serveur GameHub de AT&T : un jeu rapide et fiable vous attend.
OrderText[45]=www.gamehub.net/unreal  GameHub : un service de jeu sur Internet complet : messages, e-mail, magazines de jeu en ligne, tournois et super parties multijoueurs en ligne.
OrderText[46]=GameSpy 3D est un navigateur Internet. Il parcourt le Web et vous trouve les meilleurs serveurs sur lesquels vous pouvez jouer à Unreal : ceux dont la connexion sera la plus rapide avec votre ordinateur.
OrderText[47]=Vous n'avez qu'à repérer la partie que vous voulez, double-cliquer, et hop ! Vous êtes en plein dans l'action sur Internet !  http://www.gamespy.com pour plus d'informations.
OrderText[48]=Commandez des objets Unreal super sympa
OrderText[49]=Rendez-visite à notre site Web à l'adresse http://www.epicgames.com/UnrealOrders si vous voulez obtenir plus d'informations à propos des super objets Unreal que vous pouvez commander directement chez Epic MegaGames. Vous pouvez acheter des chapeaux, des chemises, des tapis de souris, des tasses, des posters et plus encore à des prix très raisonnables. 
OrderText[50]=Offres spéciales 
OrderText[51]=De temps en temps, Epic MegaGames vous proposera peut-être des offres spéciales qui peuvent être des combinaisons de produits logiciels Unreal et/ou d'objets Unreal. Ne ratez pas le site Web à l'adresse http://www.unreal.com, vous y trouverez les informations et les prix mis à jour.  
MenuTitle=COMMANDE D'INFORMATIONS

[UnrealHUD]
IdentifyName=Nom
IdentifyHealth=Santé

[Queen]
NameArticle=" la "

[Warlord]
NameArticle=" le "

[UnrealCoopGameOptions]
Difficulties[0]=Facile
Difficulties[1]=Moyen
Difficulties[2]=Difficile
Difficulties[3]=Irréel
HelpMessage[3]=Réglage du niveau.
MenuList[3]=Difficulté

[naliplayer]
MenuName="Nali"

[SkaarjPlayer]
MenuName=Skaarj

[MaleOne]
MenuName=Homme 1

[FemaleTwo]
MenuName="Femme 2"

[MaleTwo]
MenuName=Homme 2
