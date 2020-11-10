@echo off
echo/
echo -------------------------------------------------------------------------
echo # THis script deletes crashyltics spyware from Unity Technologies, ApS  #
echo # from games in the standard install directory of Steam to enhance      #
echo # own privacy and disallow hidden data theft                            #
echo # by GameIndustry.eu - 10/11/2020 - Version 1                           #
echo -------------------------------------------------------------------------
echo/

:: Security question
echo Do you want to continue? Press [Y]
echo If you want to cancel the process, press [N]. 
echo/
if exist "%SystemRoot%\System32\choice.exe" goto UseChoice

setlocal EnableExtensions EnableDelayedExpansion
:UseSetPrompt
set "UserChoice=N"
set /P "UserChoice=Are you sure [Y/N]? "
set "UserChoice=!UserChoice: =!"
if /I "!UserChoice!" == "N" endlocal & goto :EOF
if /I not "!UserChoice!" == "Y" goto UseSetPrompt
endlocal
goto Continue

:UseChoice
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure [Y/N] "
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