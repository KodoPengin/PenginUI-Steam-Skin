@echo off
echo/
echo -------------------------------------------------------------------------
echo # Das Script entfernt Crashlytics der Firma Unity Technologies, ApS     #
echo # aus den Installationsverzeichnissen der verschiedenen Spiele in Steam #
echo # um unerlaubten Uploads vorzubeugen und Datensicherheit zu verstÑrken  #
echo # by GameIndustry.eu - 10/11/2020 - Version 1                           #
echo -------------------------------------------------------------------------
echo/

:: Sicherheitsabfrage
echo Mîchten Sie fortfahren? DrÅcken Sie auf [Y]
echo Wenn Sie den Vorgang abbrechen mîchten, drÅcken sie auf [N]. 
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

@echo off

set ORIGINAL_DIR=%CD%

set folder="steamapps\common"
IF EXIST "%folder%" (
    cd /d %folder%
    for /f "delims=" %%i in ('dir /a-d /s /b UnityCrashHandler64.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b UnityCrashHandler32.exe') do del "%%~i"
)
chdir /d %ORIGINAL_DIR%