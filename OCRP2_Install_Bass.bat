@echo off
title Installing Modules...

if not exist %..\..\..\bass.dll goto echo1
if exist %..\..\..\bass.dll goto echo2

:ECHO1
color 6
echo This will install the BASS Libraries in the "bin/bass" folder.
echo They will be placed to the garrysmod folder, where the hl2.exe is.
echo.
echo After that the modules in "bin/modules" will be copied to "garrysmod/lua/bin".
goto echo3

:ECHO2
color 6
echo The Modules are already installed,
echo so they will get updated now.
goto echo3

:ECHO3
color 6
echo.
echo Press CTRL+C to cancel or press a key to go on.
pause > nul
goto copy

:COPY
cls
for /L %%i IN (1, 1, 750) DO (
	color 6
)

echo Copying files...
echo.

xcopy "bin\bass\*.dll" "..\..\..\*.dll" /Y /I
if errorlevel 1 goto error

echo.

xcopy "bin\modules\*.dll" "..\..\lua\bin\*.dll" /Y /I
if errorlevel 1 goto error

color 2
echo.
echo Installation complete.
echo To close this window press a key.
pause > nul
exit

:ERROR
color 4
echo.
echo Installation Failed.
echo Press CTRL+C to cancel or press a key to try again.
pause > nul
goto copy