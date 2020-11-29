@echo off
title GameIndustry.eu - Analytics Cleaner v2.5
SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion
echo !ESC![92m
echo -------------------------------------------------------------------------
echo # Das Script entfernt Crashlytics, Logs und Analyticsdienste aus dem    #
echo # Steam-Verzeichnis und dazugeh”rigen (Spiele)verzeichnissen um         #
echo # Uploads vorzubeugen und die eigene Datensicherheit zu verst„rken      #
echo # (c) by GameIndustry.eu - 30/11/2020 - Version 2.5                     #
echo -------------------------------------------------------------------------
echo/!ESC![0m

REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Fordere Adminrechte zum Entfernen der Dateien an
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:: Sicherheitsabfrage
echo !ESC![31mAchtung - Aktive Steaminstanzen werden geschlossen.!ESC![0m
echo/
echo M”chten Sie fortfahren? Drcken Sie auf [Y]
echo Wenn Sie den Vorgang abbrechen m”chten, drcken sie auf [N]. 
echo/
if exist "%SystemRoot%\System32\choice.exe" goto UseChoice

setlocal EnableExtensions EnableDelayedExpansion
:UseSetPrompt
set "UserChoice=N"
set /P "UserChoice=Sind Sie sicher [Y/N]? "
set "UserChoice=!UserChoice: =!"
if /I "!UserChoice!" == "N" endlocal & goto :EOF
if /I not "!UserChoice!" == "Y" goto UseSetPrompt
endlocal
goto Continue

:UseChoice
%SystemRoot%\System32\choice.exe /C YN /N /M "Sind Sie sicher [Y/N] "
if errorlevel 2 goto :EOF

:Continue

::Beende Tasks, sofern diese offen sind
echo/
echo Aktive Steamprozesse werden automatisch geschlossen...
echo/
::Wenn offen, beende Steam
taskkill /f /im steam.exe >nul 2>&1
taskkill /f /im SteamService.exe >nul 2>&1
taskkill /f /im steamwebhelper.exe >nul 2>&1

::steam.cfg
IF EXIST "steam.cfg" (
goto :Crash
) ELSE (
echo Vorbereitung: !ESC![92mSTEAM.CFG!ESC![0m
echo Eine !ESC![4msteam.cfg!ESC![0m wird ins Installationsverzeichnis geschrieben, die eine eigenst„ndige Aktualisierung
echo des Clients verhindert. Dies ist notwendig, da sonst zu jedem Start die Dateien neu downgeloadet werden.
echo/
@echo off
echo BootStrapperInhibitAll=enable> steam.cfg
echo BootStrapperForceSelfUpdate=disable>> steam.cfg
)

:Crash
echo !ESC![92m1.!ESC![0m Entferne Daten mit Bezug auf crash.steampowered.com....!ESC![92mOK!ESC![0m
::Entferne Daten die fr Uploads an crash.steampowered.com zust„ndig sind
IF EXIST "bin\cef\cef.win7\*.*" del "bin\cef\cef.win7\*.*" /q
IF EXIST "bin\cef\cef.win7\" RMDIR "bin\cef\cef.win7\" /s /q
IF EXIST "dumps\*.*" del "dumps\*.*" /q
IF EXIST "dumps\" RMDIR "dumps\" /s /q
IF EXIST ".crash" del ".crash" /q
IF EXIST "bin\cef\cef.win7x64\crash_reporter.cfg" del "bin\cef\cef.win7x64\crash_reporter.cfg" /q
IF EXIST "bin\cef\cef.win7x64\debug.log" del "bin\cef\cef.win7x64\debug.log" /q
IF EXIST "crashhandler64.dll" del "crashhandler64.dll" /f /q
IF EXIST "crashhandler.dll" del "crashhandler.dll" /f /q
IF EXIST "steamerrorreporter.exe" del "steamerrorreporter.exe" /f /q
IF EXIST "steamerrorreporter64.exe" del "steamerrorreporter64.exe" /f /q
IF EXIST "crashhandler64.dll" del "crashhandler64.dll" /f /q
IF EXIST "WriteMiniDump.exe" del "WriteMiniDump.exe" /f /q

echo !ESC![92m2.!ESC![0m Entferne (sofern vorhanden) Crashdumps im Systemverzeichnis....!ESC![92mOK!ESC![0m
::Entferne Crashdumps
IF EXIST "%USERPROFILE%\AppData\Local\CrashDumps\*.*" del "%UserProfile%\AppData\Local\CrashDumps\*.*" /q

echo !ESC![92m3.!ESC![0m Entferne Crashlytics von Drittanbietern....!ESC![92mOK!ESC![0m
::Crashlytics von Drittanbietern
del /s /f /q CrashUploader.Base.Azure.dll 2> nul
del /s /f /q CrashUploader.Base.dll 2> nul
del /s /f /q CrashUploader.Base.UI.dll 2> nul
del /s /f /q CrashUploader.Publish.exe 2> nul
del /s /f /q CrashUploader.Publish.exe.config 2> nul
del /s /f /q crashpad_handler.exe 2> nul
del /s /f /q CrashSender1403.exe 2> nul
del /s /f /q crashrpt_lang.ini 2> nul
del /s /f /q CrashRpt1403.dll 2> nul
del /s /f /q CrashRptProbe1403.dll 2> nul
del /s /f /q CrashReporter.dll 2> nul
del /s /f /q CrashReporter.exe 2> nul
del /s /f /q CrashUploader.Publish.exe.config 2> nul
del /s /f /q CrashReporter.exe.config 2> nul
del /s /f /q CrashReportClient.exe 2> nul
del /s /f /q CrashReportClient.pdb 2> nul

::Unity Analytics
set ORIGINAL_DIR=%CD%
set folder="steamapps\common"
for /f %%i in ('dir UnityCrashHandler*.exe /s /b 2^> nul ^| find "" /v /c') do set VAR=%%i
echo !ESC![92m4.!ESC![0m Entferne Unity Spyware und Crashlytics in Spieleverzeichnissen....!ESC![92mOK!ESC![0m
echo/
if [%VAR%]==[0] echo Super, es befanden sich keine UnityCrashHandler in den Spiele-Verzeichnissen
if %VAR% gtr 0 echo Es wurden !ESC![92m%VAR%!ESC![0m Datei/en aus den vorhandenen Spieleverzeichnissen gel”scht
IF EXIST "%folder%" (
    cd /d %folder%
for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ UnityCrashHandler*.exe') do del "%%~i"
)
chdir /d %ORIGINAL_DIR%
echo/
echo !ESC![92mFertig :]!ESC![0m
echo/
@echo off 
pause