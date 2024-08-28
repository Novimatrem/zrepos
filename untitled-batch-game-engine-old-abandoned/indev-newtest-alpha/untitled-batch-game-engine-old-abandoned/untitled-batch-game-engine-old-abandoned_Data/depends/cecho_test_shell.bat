@echo off
title cecho colors
cls
color 0f
echo cecho colors test script and instructions, to help with dev.
echo.
echo.

CALL .\depends\cecho  .\depends\cecho why, [navy]{navy}hello[default]{default}world, it's a good day!

echo.
echo.
echo results in
echo.
CALL .\depends\cecho  {default}why, {navy}hello{default} world, it's a good day!
echo.
echo.
echo Remember, use } and { instead of the ] and [ shown here.
echo.
pause
echo.
echo cecho's help upon just typing '.\depends\cecho' with no arguments:
CALL .\depends\cecho
echo.
pause
echo.
echo.





echo Due to lazy coding, game will now be killed entirely.
echo Restart it to continue.
echo.
pause

REM end
echo.
cls
color 01
cd untitled-batch-game-engine-old-abandoned_Data
./untitled-batch-game-engine-old-abandoned.bat
