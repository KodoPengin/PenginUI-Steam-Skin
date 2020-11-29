@echo off
SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion
echo !ESC![92m
echo -------------------------------------------------------------------------
echo # This script deletes crashyltics and spyware from several companies    #
echo # from installation folders in Steam itself and from game folders       #
echo # to enhance own privacy and disallow hidden data theft                 #
echo # by GameIndustry.eu - 2020/11/29 - Version 2.4                         #
echo -------------------------------------------------------------------------
echo/!ESC![0m

REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Request admin rights to remove the files
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

:: Security question
echo !ESC![31mAttention - Active Steaminstances will be closed.!ESC![0m
echo/
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

::Kill tasks if open
echo/
echo Active Steam instances will be closed...
echo/
::If open, close Steam
taskkill /f /im steam.exe 2> nul
taskkill /f /im SteamService.exe 2> nul
taskkill /f /im steamwebhelper.exe 2> nul
echo STEAM.CFG
echo A steam.cfg is written into the installation folder. It prevents Steam from automatic updates.
echo This is necessary, because Steam will download and rewrite all files to each startup.
echo/
::steam.cfg
@echo off
echo BootStrapperInhibitAll=enable> steam.cfg
echo BootStrapperForceSelfUpdate=disable>> steam.cfg

echo !ESC![92m1.!ESC![0m Delete files regarded to crash.steampowered.com (hidden upload of hard and software data)
::Delete Folder and files related to crash.steampowered.com
IF EXIST "bin\cef\cef.win7\*.*" del "bin\cef\cef.win7\*.*" /q
IF EXIST "bin\cef\cef.win7\" RMDIR "bin\cef\cef.win7\" /s /q
IF EXIST "bin\cef\cef.win7x64\crash_reporter.cfg" del "bin\cef\cef.win7x64\crash_reporter.cfg" /q
IF EXIST "bin\cef\cef.win7x64\debug.log" del "bin\cef\cef.win7x64\debug.log" /q
IF EXIST "crashhandler64.dll" del "crashhandler64.dll" /f /q
IF EXIST "crashhandler.dll" del "crashhandler.dll" /f /q
IF EXIST "steamerrorreporter.exe" del "steamerrorreporter.exe" /f /q
IF EXIST "steamerrorreporter64.exe" del "steamerrorreporter64.exe" /f /q
IF EXIST "crashhandler64.dll" del "crashhandler64.dll" /f /q
IF EXIST "WriteMiniDump.exe" del "WriteMiniDump.exe" /f /q

echo !ESC![92m2.!ESC![0m Deletes Crashlytics from Thirdparty companies
:: Thirdparty Crashlytics
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

::Unity Analytics
set ORIGINAL_DIR=%CD%
set folder="steamapps\common"

for /f %%i in ('dir UnityCrashHandler*.exe /s /b 2^> nul ^| find "" /v /c') do set VAR=%%i
echo !ESC![92m3.!ESC![0m Deletes Unity Spyware and Crashlytics in game folders
echo/
echo %VAR% file/s were deleted from game folders
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