@echo off
echo/
echo -------------------------------------------------------------------------
echo # Das Script entfernt Crashlytics verschiedener Firmen aus den          #
echo # Installationsverzeichnissen der verschiedenen Spiele in Steam         #
echo # um unerlaubten Uploads vorzubeugen und Datensicherheit zu verst„rken  #
echo # by GameIndustry.eu - 27/11/2020 - Version 2.2                         #
echo -------------------------------------------------------------------------
echo/

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

echo/
echo Das Script entfernt Crashlytics und Spyware aus dem Steamverzeichnis
echo und dazugeh”rigen Unterverzeichnissen.
echo/
echo Achtung, aktive Programminstanzen werden fr diesen Vorgang geschlossen.
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
echo Aktive Programminstanzen werden automatisch geschlossen...
echo/
::Wenn offen, beende Steam
taskkill /f /im steam.exe 2> nul
taskkill /f /im SteamService.exe 2> nul
taskkill /f /im steamwebhelper.exe 2> nul
echo STEAM.CFG
echo Eine steam.cfg wird ins Installationsverzeichnis geschrieben, die eine eigenst„ndige Aktualisierung
echo des Clients verhindert. Dies ist notwendig, da sonst zu jedem Start die Dateien neu downgeloadet werden.
echo/
::steam.cfg
@echo off
echo BootStrapperInhibitAll=enable> steam.cfg
echo BootStrapperForceSelfUpdate=disable>> steam.cfg

::Entferne Ordner
IF EXIST "bin\cef\cef.win7\*.*" del "bin\cef\cef.win7\*.*" /q
IF EXIST "bin\cef\cef.win7\" RMDIR "bin\cef\cef.win7\" /s /q
IF EXIST "bin\cef\cef.win7x64\crash_reporter.cfg" del "bin\cef\cef.win7x64\crash_reporter.cfg" /q
::Entferne Dateien
IF EXIST "crashhandler64.dll" del "crashhandler64.dll" /f /q
IF EXIST "crashhandler.dll" del "crashhandler.dll" /f /q
IF EXIST "steamerrorreporter.exe" del "steamerrorreporter.exe" /f /q
IF EXIST "steamerrorreporter64.exe" del "steamerrorreporter64.exe" /f /q
IF EXIST "crashhandler64.dll" del "crashhandler64.dll" /f /q
IF EXIST "WriteMiniDump.exe" del "WriteMiniDump.exe" /f /q
echo/

set ORIGINAL_DIR=%CD%

set folder="steamapps\common"

for /f %%i in ('dir UnityCrashHandler*.exe /s /b 2^> nul ^| find "" /v /c') do set VAR=%%i
echo Spyware und Crashlytics in Spieleverzeichnissen
echo Es wurden %VAR% Datei/en aus den vorhandenen Spieleverzeichnissen gel”scht
IF EXIST "%folder%" (
    cd /d %folder%
    for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ UnityCrashHandler*.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ crashpad_handler.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashSender1403.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ crashrpt_lang.ini') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashRpt1403.dll') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashRptProbe1403.dll') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashReporter.dll') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashReporter.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashReporter.exe.config') do del "%%~i"
)
chdir /d %ORIGINAL_DIR%
@echo off 
pause


