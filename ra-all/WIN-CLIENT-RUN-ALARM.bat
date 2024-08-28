@echo off
cls
@title alarm clock runner for win
cd /D "%~dp0"
REM the pings are just for timeout/sleep, a small wait
@ping -n 2 -w 1000 0.0.0.1 > NUL 
echo alarm clock runner for win
echo.
echo Required dependencies: 
echo Git Bash, Microsoft's modern 'Windows Terminal'.
echo.
echo When you're ready to start,
cls
echo.
echo Starting...
echo.
cd /D "%~dp0"
REM the pings are just for timeout/sleep, a small wait
@ping -n 3 -w 1000 0.0.0.1 > NUL 
echo Cleaning up...
taskkill /IM bash.exe /F
wt C:\Users\%username%\AppData\Local\Microsoft\WindowsApps\wt.exe "C:\Program Files\Git\git-bash.exe" -c "bash CLIENT-RUN-ALARM.sh"
taskkill /IM bash.exe /F
echo This window can be closed now.
exit
REM EOF

