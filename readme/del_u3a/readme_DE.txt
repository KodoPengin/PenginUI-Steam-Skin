Name: Crashlytics, Logs und Spyware aus Steam und dazugehörigen (Spiele)verzeichnissen löschen
Quelle: https://gameindustry.eu/
Author: Pengin
Version: 2.7
Datum: 07.01.2021

Datei/en:
del_u3a_de.bat
Hash: 0f0448fb2abbdc1e8a3fc59b1cd3c1375051b0f4c1525b986ad356be2c9df143

--------------------------

Installation:

Kopiere die del_u3a_de.bat in das jeweilige Steam,- oder "Bibliotheks"verzeichnis und starte die Datei.

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

- Funktionen zum Leeren des "Caches" hinzugefügt
- Menü überarbeitet, Hash, Dateigröße und Historie hinzugefügt
- UnityEngine.CrashReportingModules hinzugefügt
- CD Projekt RED Crashlytics hinzugefügt
- Es wird nun überprüft ob eine Steam.cfg vorhanden ist
- Bessere Ausgabe der Unity Analytics
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
bin\cef\cef.win7\*.*
dumps\*.*
bin\cef\cef.win7x64\crash_reporter.cfg
bin\cef\cef.win7x64\debug.log
.crash
crashhandler.dll
crashhandler64.dll
steamerrorreporter.exe
steamerrorreporter64.exe
WriteMiniDump.exe

- Drittanbieter Crashlytics
*.log
*.dmp
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
CrashReporter.resources.dll
REDEngineErrorReporter.exe
UnityCrashHandler32.exe
UnityCrashHandler64.exe
UnityEngine.CrashReportingModule.dll
UnityEngine.CrashReportingModule.dll.mdb