@echo off
@title bash text adventure Launcher (Win10 LTSC) v38b
cls
echo To run this game on Windows 10 LTSC, you require at least
echo Windows 10 build 17063 or later.
echo.
echo To continue,
pause
echo Downloading deps for LTSC.
cd /D "%~dp0"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/microsoft/terminal/releases/download/v1.18.1462.0/Microsoft.WindowsTerminalPreview_1.18.1462.0_x64.zip', 'package.zip')"
powershell -Command "Invoke-WebRequest https://github.com/microsoft/terminal/releases/download/v1.18.1462.0/Microsoft.WindowsTerminalPreview_1.18.1462.0_x64.zip -OutFile package.zip"
unzip package.zip
powershell -command "Expand-Archive -Force '%~dp0package.zip' '%~dp0'"
cd /D "%~dp0"
cd terminal-1.18.1462.0
.\wt.exe wt.exe "C:\Program Files\Git\git-bash.exe" -c "bash ../textadv.sh"
cd /D "%~dp0"

REM EOF
pause
:eof
exit
