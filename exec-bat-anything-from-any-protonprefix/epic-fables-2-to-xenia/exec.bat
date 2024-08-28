@echo off

REM requires start.exe, msiexec.exe, and cmd.exe from your wine system install,
REM place those in the game folder. replace Epic_Princess.exe with cmd.exe (renamed to that).
REM put the newest epic games store installer in the game folder alongside those.
REM then run the game and in the command line: start msiexec /i EpicInstaller-15.17.1.msi
REM install epic games store to C:\Epic Games exactly (pick C:\ when it asks Browse)
REM then put this script in the folder, run Epic Princess again, and type exec
REM if the installer ever pops up asking you to Repair, do it.
REM profit.

echo bongo

dir
echo nowwork
start xenia.exe
exit
cd C:\


cd ..
cd ..

dir
whoami

for %%I in (.) do echo %%~nxI
echo test1
cd compatdata
cd 2195670
cd pfx
cd drive_C
cd Epic Games
cd "Epic Games"
cd 'Epic Games'

REM ./Portal/Extras/Redist/LauncherPrereqSetup_x64.exe
cd Launcher
cd Portal
cd Extras
cd Redist
LauncherPrereqSetup_x64.exe
for %%I in (.) do echo %%~nxI

cd ..
cd ..
cd ..
cd ..
REM -----
echo tim
for %%I in (.) do echo %%~nxI
cd Epic Games
cd Launcher
cd Portal
cd Binaries
cd Win32
for %%I in (.) do echo %%~nxI
dir
EpicGamesLauncher.exe

echo done
exit
pause
