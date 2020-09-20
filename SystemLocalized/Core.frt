[Language]
Language=Français
LangId=12
SubLangId=0

[Public]
Preferences=(Caption="Avancées",Parent="Options avancées")
Preferences=(Caption="Système de fichiers",Parent="Avancées",Class=Core.System,Immediate=True)

[Errors]
Unknown=Erreur inconnue 
Aborted=Abandonné 
ExportOpen=Erreur d'exportation de %s: impossible d'ouvrir le fichier '%s'
ExportWrite=Erreur d'exportation de %s: impossible d'écrire dans le fichier '%s'
FileNotFound=Impossible de trouver le fichier '%s'
ObjectNotFound=Echec de recherche de l'objet '%s %s.%s'
PackageNotFound=Impossible de trouver le fichier pour package '%s'
PackageResolveFailed=Impossible de confirmer le nom du package 
FilenameToPackage=Impossible de convertir le nom de fichier '%s' en nom de package 
Sandbox=Le package '%s' n'est pas accessible dans ce bac à sable 
PackageVersion=Différence de version de package '%s'
FailedLoad=Echec de chargement de '%s': %s 
ConfigNotFound=Impossible de trouver '%s' dans le fichier de configuration 
LoadClassMismatch=%s n'est pas une classe enfant de %s.%s 
NotDll='%s' n'est pas un package DLL ; impossible de trouver '%s' d'exportation 
NotInDll=Impossible de trouver '%s' dans '%s.dll'
FailedLoadPackage=Echec de chargement du package : %s 
FailedLoadObject=Echec de chargement de '%s %s.%s' : %s 
TransientImport=Objet transitoire importé : %s 
FailedSavePrivate=Impossible d'enregistrer %s : Le graphique est lié à l'objet privé externe %s 
FailedImportPrivate=Impossible d'importer l'objet privé %s %s.
FailedCreate=%s %s introuvable pour la création 
FailedImport=Impossible de trouver %s dans le fichier '%s'
FailedSaveFile=Erreur d'enregistrement du fichier '%s' : %s 
SaveWarning=Erreur d'enregistrement de '%s'
NotPackaged=L'objet n'est pas sous forme de package : %s %s
NotWithin=Objet %s %s créé en %s au lieu de %s
Abstract=Impossible de créer l'objet %s : la classe %s est abstraite
NoReplace=Impossible de remplacer %s par %s
NoFindImport=Impossible de trouver le fichier '%s' pour l'importer
ReadFileFailed=Echec de lecture du fichier '%s' pour l'importer
SeekFailed=Erreur de recherche de fichier
OpenFailed=Erreur d'ouverture de fichier
WriteFailed=Erreur d'écriture dans un fichier
ReadEof=Lire au-delà de la fin du fichier
IniReadOnly=Le fichier %s est protégé en écriture ; enregistrement des paramètres impossible
UrlFailed=Echec de lancement de l'URL
Warning=Attention
Question=Question
OutOfMemory=Mémoire virtuelle saturée. Pour y remédier, libérez de l'espace sur votre disque dur principal.
History=Historique
Assert=Echec d'assertion : %s [File:%s] [Line: %i]
Debug=Echec de débogage de l'assertion : %s [File:%s] [Line: %i]
LinkerExists=Le créateur de liens de '%s' existe déjà
BinaryFormat=Le fichier '%s' contient des données non reconnues
SerialSize=%s : Différence de taille série : Reçu %i, Attendu %i
ExportIndex=Index d'exportation erroné %i/%i
ImportIndex=Index d'importation erroné %i/%i
Password=Mot de passe non reconnu
Exec=Commande non reconnue
BadProperty='%s' : Propriété erronée ou manquante '%s'
MisingIni=Fichier .ini manquant : %s

[Query]
OldVersion=Le fichier %s a été enregistré dans une version précédente qui n'est pas compatible avec celle-ci. Il est probable que la lecture du fichier échoue et entraîne un plantage du système. Souhaitez-vous essayer malgré tout ?
Name=Nom :
Password=Mot de passe :
PassPrompt=Veuillez indiquer vos nom et mot de passe :
PassDlg=Vérification d'identité
Overwrite=Le fichier '%s' doit être mis à jour. Souhaitez-vous supprimer la version existante ? 
[Progress]
Saving=Enregistrement du fichier %s...
Loading=Chargement du fichier %s...
Closing=Fermeture

[General]
Product=Unreal
Engine=Moteur de Unreal
Copyright=Copyright 1998 Epic MegaGames, Inc.
True=Vrai
False=Faux
None=Aucun
Yes=Oui
No=Non
