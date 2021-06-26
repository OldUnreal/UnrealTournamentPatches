[Public]
Object=(Name=Engine.ServerCommandlet,Class=Class,MetaClass=Core.Commandlet)
Object=(Name=Engine.CheckSumCommandlet,Class=Class,MetaClass=Core.Commandlet)
; Main roots
; EN: Preferences=(Caption="Advanced",Parent="Advanced Options")
Preferences=(Caption="Zaawansowane",Parent="Opcje zaawansowane")
; EN: Preferences=(Caption="Rendering",Parent="Advanced Options")
Preferences=(Caption="Wykonanie",Parent="Opcje zaawansowane")
; EN: Preferences=(Caption="Audio",Parent="Advanced Options")
Preferences=(Caption="Audio",Parent="Opcje zaawansowane")
; EN: Preferences=(Caption="Networking",Parent="Advanced Options")
Preferences=(Caption="Obsługa sieci",Parent="Opcje zaawansowane")
; EN: Preferences=(Caption="Game Types",Parent="Advanced Options")
Preferences=(Caption="Typy gier",Parent="Opcje zaawansowane")
; EN: Preferences=(Caption="Display",Parent="Advanced Options")
Preferences=(Caption="Pokaz",Parent="Opcje zaawansowane")
; EN: Preferences=(Caption="Joystick",Parent="Advanced Options")
Preferences=(Caption="Drążek sterowy",Parent="Opcje zaawansowane")
; EN: Preferences=(Caption="Drivers",Parent="Advanced Options",Class=Engine.Engine,Immediate=False,Category=Drivers)
Preferences=(Caption="Sterowniki",Parent="Opcje zaawansowane",Class=Engine.Engine,Immediate=False,Category=Drivers)
; EN: Preferences=(Caption="Game Settings",Parent="Advanced Options",Class=Engine.GameInfo,Immediate=True)
Preferences=(Caption="Ustawienia gry",Parent="Opcje zaawansowane",Class=Engine.GameInfo,Immediate=True)
; Advanced
; EN: Preferences=(Caption="Game Engine Settings",Parent="Advanced",Class=Engine.GameEngine,Category=Settings,Immediate=True)
Preferences=(Caption="Ustawienia silnika",Parent="Zaawansowane",Class=Engine.GameEngine,Category=Settings,Immediate=True)
; EN: Preferences=(Caption="Key Aliases",Parent="Advanced",Class=Engine.Input,Immediate=True,Category=Aliases)
Preferences=(Caption="Aliasy klawiszy",Parent="Zaawansowane",Class=Engine.Input,Immediate=True,Category=Aliases)
; EN: Preferences=(Caption="Raw Key Bindings",Parent="Advanced",Class=Engine.Input,Immediate=True,Category=RawKeys)
Preferences=(Caption="Konfiguracja klawiszy",Parent="Zaawansowane",Class=Engine.Input,Immediate=True,Category=RawKeys)
; Networking
; EN: Preferences=(Caption="Public Server Information",Parent="Networking",Class=Engine.GameReplicationInfo,Immediate=True)
Preferences=(Caption="Publiczne Dane Serwera",Parent="Obsługa sieci",Class=Engine.GameReplicationInfo,Immediate=True)

[PlayerPawn]
; EN: QuickSaveString="Quick Saving"
QuickSaveString="Szybki zapis w toku"
; EN: NoPauseMessage="Game is not pauseable"
NoPauseMessage="Brak możliwości zatrzymania gry"
; EN: ViewingFrom="Now viewing from "
ViewingFrom="Widok z kamery: "
; EN: OwnCamera="own camera"
OwnCamera="własnej"
; EN: FailedView="Failed to change view."
FailedView="Brak możliwości zmiany widoku."
; EN: CantChangeNameMsg="You can't change your name during a global logged game."
CantChangeNameMsg="Podczas rozgrywki globalnej, której przebieg jest zapisywany, nie ma możliwości zmiany imienia."

[Pawn]
; EN: NameArticle=" a "
NameArticle=" "

[Inventory]
; EN: PickupMessage="Snagged an item"
PickupMessage="Podniesiono przedmiot"
; EN: ItemArticle="a"
ItemArticle=" "
; EN: M_Activated=" activated."
M_Activated=" włączony."
; EN: M_Selected=" selected."
M_Selected=" gotowy do użycia."
; EN: M_Deactivated=" deactivated."
M_Deactivated=" wyłączony."

[LevelInfo]
; EN: Title="Untitled"
Title="Mapa bez tytułu"

[Weapon]
; EN: MessageNoAmmo=" has no ammo."
MessageNoAmmo=" nie ma amunicji."
; EN: DeathMessage="%o was killed by %k's %w."
DeathMessage="%o - %k zabija cię %w."
; EN: PickupMessage="You got a weapon"
PickupMessage="Podnosisz broń"
; EN: ItemName="Weapon"
ItemName="Broń"
; EN: DeathMessage[0]="%o was killed by %k's %w."
DeathMessage[0]=%o - %k zabija cię %w.
; EN: DeathMessage[1]="%o was killed by %k's %w
DeathMessage[1]=%o - %k zabija cię %w.
; EN: DeathMessage[2]="%o was killed by %k's %w."
DeathMessage[2]=%o - %k zabija cię %w.
; EN: DeathMessage[3]="%o was killed by %k's %w."
DeathMessage[3]=%o - %k zabija cię %w.

[Ammo]
; EN: PickupMessage="You picked up some ammo"
PickupMessage="Podnosisz amunicję"
; EN: ItemName="Ammo"
ItemName="Amunicja"

[Counter]
; EN: CountMessage="Only %i more to go..."
CountMessage="Pozostało: %i..."
; EN: CompleteMessage="Completed!"
CompleteMessage="Gotowe!"

[Spectator]
; EN: MenuName="Spectator"
MenuName="Widz"

[DamageType]
; EN: Name="killed"
Name="zabity"
; EN: AltName="killed"
AltName="zabity"

[Progress]
; EN: CancelledConnect="Cancelled Connect Attempt"
CancelledConnect="Próba połączenia anulowana"
; EN: RunningNet="%ls: %ls (%i players)"
RunningNet="%ls: %ls (liczba graczy: %i)"
; EN: NetReceiving="Receiving „%ls”: %i/%i"
NetReceiving="Trwa pobieranie pliku „%ls”: %i/%i"
; EN: NetReceiveOk="Successfully received „%ls”"
NetReceiveOk="Plik „%ls” został pobrany pomyślnie"
; EN: NetSend="Sending „%ls”"
NetSend="Trwa wysyłanie pliku „%ls”"
; EN: NetSending="Sending „%ls”: %i/%i"
NetSending="Trwa wysyłanie pliku „%ls”: %i/%i"
; EN: Connecting="Connecting..."
Connecting="Łączenie w toku..."
; EN: Listening="Listening for clients..."
Listening="Nasłuch klientów w toku..."
; EN: Loading="Loading"
Loading="Trwa wczytywanie"
; EN: Saving="Saving"
Saving="Trwa zapisywanie"
; EN: Paused="Paused by %ls"
Paused="Zatrzymane przez %ls"
; EN: ReceiveFile="Receiving „%ls” (F10 Cancels)"
ReceiveFile="Trwa pobieranie pliku „%ls” (użyj klawisza F10, aby anulować)"
; EN: ReceiveOptionalFile="Receiving optional file „%ls” (Press F10 to Skip)"
ReceiveOptionalFile="Trwa pobieranie opcjonalnego pliku „%ls” (użyj klawisza F10, aby pominąć plik)"
; EN: ReceiveSize="Size %iK, Complete %3.1f%% = %iK, %i Packages remaining"
ReceiveSize="Rozmiar %iK, Ukończono %3.1f%% = %iK, pozostało plików: %i"
; EN: ConnectingText="Connecting (F10 to cancel):"
ConnectingText="Łączenie w toku (F10 aby anulować):"
ConnectingURL="unreal://%ls/%ls"

[WarpZoneInfo]
OtherSideURL=""

[Pickup]
ExpireMessage=""

[SpecialEvent]
DamageString=""

[ServerCommandlet]
HelpCmd=server
HelpWebLink="https://www.oldunreal.com/wiki/index.php?title=Commandlet"
; EN: HelpOneLiner="Network game server."
HelpOneLiner="Serwer gry sieciowej."
; EN: HelpUsage="server map.unr[?game=gametype] [-option...] [parm=value]..."
HelpUsage="server map.unr[?game=TypyGier] [-option...] [parm=value]..."
HelpParm[0]="Log"
; EN: HelpDesc[0]="Specify the log file to generate."
HelpDesc[0]="Wprowadza nazwę pliku dziennika, który będzie utworzony."
HelpParm[1]="AllAdmin"
; EN: HelpDesc[1]="Give all players admin privileges."
HelpDesc[1]="Nadaje wszystkim graczom uprawnienia administracyjne."

[Console]
; EN: ClassCaption="Standard Unreal Tournament Console"
ClassCaption="Konsola domyślna Unreal Tournament"
; EN: LoadingMessage="LOADING"
LoadingMessage="WCZYTYWANIE W TOKU"
; EN: SavingMessage="SAVING"
SavingMessage="ZAPISYWANIE W TOKU"
; EN: ConnectingMessage="CONNECTING"
ConnectingMessage="ŁĄCZENIE W TOKU"
; EN: PausedMessage="PAUSED"
PausedMessage="GRA ZATRZYMANA"
; EN: PrecachingMessage="PRECACHING"
PrecachingMessage="BUFOROWANIE W TOKU"
; EN: ChatChannel="(CHAT) "
ChatChannel="(OGÓL.) "
; EN: TeamChannel="(TEAM) "
TeamChannel="(DRUŻ.) "

[Menu]
MenuList=" "
HelpMessage=" "
; EN: HelpMessage[1]="This menu has not yet been implemented."
HelpMessage[1]="Menu niedostępne."
; EN: LeftString="Left"
LeftString="Lewo"
; EN: RightString="Right"
RightString="Prawo"
; EN: CenterString="Center"
CenterString="Środek"
; EN: EnabledString="Enabled"
EnabledString="wł."
; EN: DisabledString="Disabled"
DisabledString="wył."
; EN: YesString="Yes"
YesString="tak"
; EN: NoString="No"
NoString="nie"

[GameInfo]
; EN: SwitchLevelMessage="Switching Levels"
SwitchLevelMessage="Trwa zmiana mapy"
DefaultPlayerName="Player"
; EN: LeftMessage=" left the game."
LeftMessage=" opuszcza rozgrywkę."
; EN: FailedSpawnMessage="Failed to spawn player actor"
FailedSpawnMessage="Nie udało się utworzyć postaci gracza"
; EN: FailedPlaceMessage="Could not find starting spot (level might need a "PlayerStart" actor)"
FailedPlaceMessage="Nie znaleziono punktu początkowego. Najprawdopodobniej, mapa nie zawiera aktora „PlayerStart”."
; EN: FailedTeamMessage="Could not find team for player"
FailedTeamMessage="Nie znaleziono drużyny, do której możnaby przydzielić gracza"
; EN: NameChangedMessage="Name changed to "
NameChangedMessage="Nowe imię: "
; EN: EnteredMessage=" entered the game."
EnteredMessage=" dołącza do gry."
; EN: GameName="Game"
GameName="Gra"
; EN: MaxedOutMessage="Server is already at capacity."
MaxedOutMessage="Brak wolnych miejsc na serwerze."
; EN: WrongPassword="The password you entered is incorrect."
WrongPassword="Wprowadzone hasło jest błędne."
; EN: NeedPassword="You need to enter a password to join this game."
NeedPassword="Aby dołączyć do wybranej rozgrywki, należy wprowadzić hasło."
; EN: MaleGender="his"
MaleGender="jego"
; EN: FemaleGender="her"
FemaleGender="jej"
; EN: IPBanned="Your IP address has been banned on this server."
IPBanned="Twój adres IP został zbanowany na tym serwerze."

[Errors]
; EN: NetOpen="Error opening file"
NetOpen="Błąd odczytu pliku"
; EN: NetWrite="Error writing to file"
NetWrite="Błąd zapisu pliku"
; EN: NetRefused="Server refused to send „%ls”"
NetRefused="Serwer odrzuca żądanie pobrania pliku „%ls”"
; EN: NetClose="Error closing file"
NetClose="Błąd zamykania pliku"
; EN: NetSize="File size mismatch"
NetSize="Niezgodność rozmiaru pliku"
; EN: NetMove="Error moving file"
NetMove="Błąd przenoszenia pliku"
; EN: NetInvalid="Received invalid file request"
NetInvalid="Otrzymano nieprawidłowe żądanie pobrania pliku"
; EN: NoDownload="Package „%ls” is not downloadable"
NoDownload="Plik „%ls” nie jest udostępniony do pobierania"
; EN: DownloadFailed="Downloading package „%ls” failed: %ls"
DownloadFailed="Pobieranie pliku „%ls” nieudane: %ls"
; EN: RequestDenied="Server requested file from pending level: Denied"
RequestDenied="Żądanie pobrania pliku powiązanego z mapą w kolejce: odrzucone"
; EN: ConnectionFailed="Connection failed"
ConnectionFailed="Połączenie nieudane"
; EN: ChAllocate="Couldn't allocate channel"
ChAllocate="Założenie kanału nieudane"
; EN: NetAlready="Already networking"
NetAlready="Połączenie sieciowe już zostało nawiązane"
; EN: NetListen="Listen failed: No linker context available"
NetListen="Nasłuch nieudany: brak łączy kontekstowych"
; EN: LoadEntry="Can't load Entry: %ls"
LoadEntry="Nieudane wczytywanie mapy Entry: %ls"
; EN: InvalidUrl="Invalid URL: %ls"
InvalidUrl="Niewłaściwy adres URL: %ls"
; EN: InvalidLink="Invalid Link: %ls"
InvalidLink="Niewłaściwe łącze: %ls"
; EN: FailedBrowse="Failed to enter %ls: %ls"
FailedBrowse="Nieudane wejście na %ls: %ls"
; EN: Listen="Listen failed: %ls"
Listen="Nasłuch nieudany: %ls"
; EN: AbortToEntry="Failed; returning to Entry"
AbortToEntry="Nieudane, trwa powrót do mapy Entry"
; EN: ServerOpen="Servers can't open network URLs"
ServerOpen="Otwieranie adresów URL na serwerach niemożliwe"
; EN: ServerListen="Dedicated server can't listen: %ls"
ServerListen="Nasłuch niemożliwy na serwerze dedykowanym: %ls"
; EN: Pending="Pending connect to „%ls” failed; %ls"
Pending="Oczekujące połączenie z „%ls” nieudane; %ls"
; EN: LoadPlayerClass="Failed to load player class"
LoadPlayerClass="Błąd wczytywania klasy postaci"
; EN: ServerOutdated="Server's version is outdated"
ServerOutdated="Przestarzała wersja serwera"
; EN: ClientOutdated="You need to upgrade to the latest patch version"
ClientOutdated="Musisz zaktualizować do najnowszej wersji poprawki"
; EN: RejectedByServer="Rejected by server"
RejectedByServer="Odrzucony przez serwer"
; EN: NetDecompressFail="Error decompressing file "%ls""
NetDecompressFail="Błąd podczas dekompresji pliku „%ls”"
; EN: MD5ChecksumFailed="Package %ls failed an MD5 check."
MD5ChecksumFailed="Pakiet %ls nie przeszedł kontroli MD5."

[General]
; EN: Upgrade="To enter this server, you need the latest free update to Unreal Tournament available from OldUnreals's Web site:"
Upgrade="Aby dołączyć do rozgrywki na wybranym serwerze, należy zaktualizować Unreal Tournament przy pomocy darmowej aktualizacji dostępnej na stronie WWW OldUnreal:"
UpgradeURL="http://www.oldunreal.com/oldunrealpatches.html"
; EN: UpgradeQuestion="Do you want to launch your web browser and go to the upgrade page now?"
UpgradeQuestion="Czy chcesz uruchomić przeglądarkę internetową i udać się na witrynę z aktualizacją?"
; EN: Version="Version %i"
Version="Wersja %i"

[CheckSumCommandlet]
HelpCmd=checksum
HelpWebLink="https://www.oldunreal.com/wiki/index.php?title=Commandlet"
; EN: HelpOneLiner="Calculate package checksum for stat logging"
HelpOneLiner="Oblicz sumę kontrolną pakietu na potrzeby rejestrowania statystyk"
; EN: HelpUsage="checksum packagename.u"
HelpUsage="checksum nazwa_pakietu.u"
; EN: HelpParm[0]="packagename.u"
HelpParm[0]="nazwa_pakietu.u"
; EN: HelpDesc[0]="Filename to calculate checksum"
HelpDesc[0]="Nazwa pliku do obliczenia sumy kontrolnej"
