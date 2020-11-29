Name: Crashlytics, Logs und Spyware aus Steam und dazugehörigen (Spiele)verzeichnissen löschen
Quelle: https://gameindustry.eu/
Author: Pengin
Version: 2.4
Datum: 29.11.2020

Datei/en:
del_u3a_de.bat
Hash: 091712e4ceb9c46f672aa4b329cccdc1d68bfe2e9a441d7781cfa373218910f8

--------------------------

Installation:

Kopiere die Datei del_u3a_de.bat das Steam-Installationsverzeichnis z.b. "C:\Steam" und starte die Datei

Wurden alternative Steambibliotheken angelegt, muss die Datei ins jeweilige Verzeichnis kopiert
und von dort aus gestartet werden

--------------------------

Beschreibung:

Die Batch durchforstet innerhalb des Steamordners Dateien nach Crashlytics und Logs und löscht dazugehörige Dateien.
Zusätzlich wird der CrashDump Ordner (sofern vorhanden) im Nutzerverzeichnis geleert.

Dies beugt einer heimlichen Datenaufnahme und Versand von Crashlytics durch Firmen wie Unity Technologies, ApS, Epic Games, Inc.,
oder der Valve Corporations vor und verstärkt die eigene Privatsphäre während der eigenen Spiele-Sessions.

Das Script wird nach Bedarf erweitert.

Die Batch erstellt eine "steam.cfg". Die Datei verhindert die automatische Aktualisierung des Steam-Clients.
Dies ist notwendig, da Steam sonst zu jedem Start Dateien neu downloadet und überschreibt.
Anwender die eigene Layoutmodifikationen für Steam nutzen kennen das Vorgehen wahrscheinlich. 

Um Steam wie gewohnt zu aktualisieren muss die Steam.cfg (temporär) aus dem Installationsverzeichnis entfernt werden.

--------------------------

Letzte Änderungen:

- CrashDump Ordner hinzugefügt
- Beschreibungen während des Löschvorgangs ergänzt
- Dateiliste hinzugefügt
- Eine steam.cfg wird ins Installationsverzeichnis geschrieben
- Weitere Crashlytics von Drittanbieterfirmen und Steam hinzugefügt
- Bugfix der verhinderte dass Dateien wirklich gelöscht wurden
- Fehlerausgabe bei 0 Ergebnissen unterdrückt
- Es wird angezeigt wieviele Dateien gelöscht wurden

--------------------------

Folgende Dateien und Ordner werden mit dieser Batch gelöscht:

- System
%Nutzername%\Appdata\Local\CrashDumps\*.*

- Steam
dumps\*.*
bin\cef\cef.win7\
bin\cef\cef.win7x64\crash_reporter.cfg
bin\cef\cef.win7x64\debug.log
.crash
crashhandler64.dll
crashhandler.dll
steamerrorreporter.exe
steamerrorreporter64.exe
crashhandler64.dll
WriteMiniDump.exe

- Drittanbieter Crashlytics
CrashUploader.Base.Azure.dll
CrashUploader.Base.dll
CrashUploader.Base.UI.dll
CrashUploader.Publish.exe
CrashUploader.Publish.exe.config
crashpad_handler.exe
CrashSender1403.exe
crashrpt_lang.ini
CrashRpt1403.dll
CrashRptProbe1403.dll
CrashReporter.dll
CrashReporter.exe
CrashUploader.Publish.exe.config
CrashReporter.exe.config
CrashReportClient.exe
CrashReportClient.pdb
UnityCrashHandler32.exe
UnityCrashHandler64.exe