REM untitled batch game


@echo off

endlocal
color 01
color 4F
color 01
SET ACTUALGAMENAME=untitled batch game - artmode only

title %ACTUALGAMENAME%

cls
copy /y NUL .\logs\log.txt >NUL
cls
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls

REM Warn the user that settings need to be set correctly for the game to function properly (at least right now).
cls
echo %ACTUALGAMENAME% cannot currently automatically detect/fix    these, so please
echo make sure your configuration matches the following.
echo.
echo (in later versions the game will detect/fix these for you automatically)
echo                                                                         (maybe)
echo.
echo.
echo.
echo Requirements:
echo - You must have Windows 7 set as your winecfg OS selection version.
echo - You must have a relatively new Wine version, maybe 3.15 or above.
echo - You must leave the Window Size at it's default size.
echo - You must NOT run the game using Windows itself, it must be Wine on Linux.
echo - You must be using the Wine Command Prompt, ($ wine start cmd).
echo.
echo - If you see any scroll-bar on the window, restart the game until you don't.
echo.
echo Once you're sure that's all correct;

color 4F & pause & cls & goto begingame & cls & color 01
color 01
cls
goto begingame
cls
exit


REM Okay, let's start.
REM Begin getting the game ready.

REM Lots of cls to hide errors that aren't actually errors/problems.
:begingame
cls
color 01
cls
cd artmode-only_Data
cls


REM Make a logfile to log to if one does not exist.
cls
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls

REM Change version number when you update the game at all, used in lots of
REM places but you only have to change it here due to the power of variables.
SET VERSION=ART
SET DEVSTAGE=null v

REM Combine the above two into vars 'fullverinfo' for easier usage later.
SET FULLVERINFO=%DEVSTAGE%%VERSION%

REM Vanity update names:
SET MOJANGNAME="novi art dev test"

REM Set window title in most situations, cd into data folder so we have
REM access to the sounds and stuff if some some very strange reason
REM it isn't already in there.
title %ACTUALGAMENAME% (%FULLVERINFO%)
cd artmode-only_Data
cls



REM Log information about the current build for help fixing bugs.

echo. >> .\logs\log.txt
echo This is the LOG FILE for the game.  >> .\logs\log.txt
echo There may be CONTENT AND ENDING SPOILERS that may entirely RUIN YOUR GAME EXPERIENCE if seen early or without context.  >> .\logs\log.txt
echo Even innocent code or regular looking comments may contain SECRETS and SPOILERS, ruining your fun.  >> .\logs\log.txt
echo Please do not look further unless you have already experienced and played the game as much as you will do.  >> .\logs\log.txt
echo. >> .\logs\log.txt

echo. >> .\logs\log.txt
echo %ACTUALGAMENAME% IS LOGGING WHAT HAPPENS IN THE GAME TO MAKE BUG-SPOTTING EASIER  >> .\logs\log.txt
echo THIS WILL ONLY BE SEEN BY THOSE WHO YOU SHARE IT WITH, IF YOU ENCOUNTER BUGS PLEASE SEND TO THE DEVELOPER  >> .\logs\log.txt
echo ALONG WITH A DESCRIPTION OF WHAT OCCURED WHEN THE BUG HAPPENED, AND IT WILL BE FIXED/CORRECTED ASAP.  >> .\logs\log.txt
echo FEEL FREE TO INCLUDE MEDIA SUCH AS SCREENSHOTS/VIDEOS, DEV CONTACT INFO SEEN ON GAME-LAUNCH.  >> .\logs\log.txt
echo. >> .\logs\log.txt
echo "===================================================" >> .\logs\log.txt
echo [REPORT] GAME STARTED AT %TIME% %DATE%>> .\logs\log.txt
echo [REPORT] GAME VERSION "%fullverinfo%" >> .\logs\log.txt
echo [REPORT] GAME VERSION VANITY NAME "%MOJANGNAME%" >> .\logs\log.txt

REM Log information about logging and the prefixes I use to split info, for easier reading of the log.
echo. >> .\logs\log.txt
echo "===================================================" >> .\logs\log.txt
echo "LOG PREFIXES KEY:" >> .\logs\log.txt
echo. >> .\logs\log.txt
echo "REPORT - log of things to do with the game internally, that are somewhat important." >> .\logs\log.txt
echo "TURNCOUNTER - log of things to do with the internal time system for turn-based things." >> .\logs\log.txt
echo "USR - log of user actions." >> .\logs\log.txt
echo "USR_DID - log of those same user actions, sometimes USR misses them, USR_DID is more raw and unfiltered but also a little later.." >> .\logs\log.txt
echo "ERROR - log of something that has gone wrong and a developer needs to fix ASAP." >> .\logs\log.txt
echo "USR_ERR_NOT_ROOM - log of when the user tries to interact with something that the are not in the same 'room' as." >> .\logs\log.txt
echo "BCHAR_ART - log of when the game does things in regards to block character art, which is logged about due to the large rendering time they have." >> .\logs\log.txt
echo "WEIGHT - how fatty the user has gotten. (more of a curiosity than anything)" >> .\logs\log.txt
echo "===================================================" >> .\logs\log.txt
echo. >> .\logs\log.txt

cls
copy /y NUL .\logs\log.txt >NUL
cls
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls

REM Set query to blank LONG BEFORE we actually start to ask for user input,
REM so that we can check against if query is blank to resolve some parsing
REM issues.
set QUERY=




REM WEIGHT GAIN SYSTEM MUST NOW ALWAYS BE ON OR THE GAME WILL DIE
set WEIGHTGAINSYSTEM==1
if %weightgainsystem%==1 goto weightsystem


REM INIT INITIAL VALUES FOR WEIGHT AND STUFF
:weightsystem
REM Set weight and height to default amount for the weight gain system.
set WEIGHT=160
REM 160 IS THE MINIMUM FOR TECHNICAL REASONS
REM 160 IS THE DEFAULT WEIGHT

REM Set height
set HEIGHTFOOT=5
set HEIGHTINCH=4

REM Set the measurement we use to show weight, lbs is my favourite.
set WEIGHTSYMBOL=lbs

REM Set the descriptors for height
set HEIGHTSYMBOLFOOT=ft,
set HEIGHTSYMBOLINCH=in.

REM Weight rankings based on BMI's ideas will be shown depending on current weight.
set WEIGHTRANKERRORZERO=Normal weight.
set WEIGHTRANKERRORLOW=Normal weight.
set WEIGHTRANK1=Normal weight.
set WEIGHTRANK2=Overweight.
set WEIGHTRANK3=Obese.
set WEIGHTRANK4=morbidly obese.
set WEIGHTRANK5=very severely obese.
set WEIGHTRANKSOB=super obese.
set WEIGHTRANK6=as fatty as REDACTED the game's dev is.
set WEIGHTRANK7=as fatty as REDACTED the game's dev is.
set WEIGHTRANKSECRET=as fatty as REDACTED the game's dev is.
set WEIGHTRANKERRORHIGH=as fatty as REDACTED the game's dev is.

REM Set up the variable for winning through the weight victory condition
set weightVICTORY=0
set weightVICTORYfirst=0

REM We use renderweightdisplay to determine whether or not the player is reminded of their weight each turn.
REM This can be disabled if, for example, art or text is required to fill more space than usual.
SET renderweightdisplay==1

REM Setup a turn-counter variable for use in tracking time and turn-based combat and such.
SET /A turncounter==1
set /A turncounter=%turncounter% + 0

REM Enable delayed expansion to fix some parsing issues and lets me be
REM a little more lazy with my code in some situations, always have this.
REM Yes, it causes issues in some cases, but making my own save file
REM system (which is relatively easy to do) can get around some of them.
setlocal ENABLEDELAYEDEXPANSION


REM Set that we start in the first room of the game, room 0 is an error code.
set ROOMID==1


REM Set first to 1 so that it knows to only describe the room 1 once.
set FIRST=1


REM Set color to default, which shares room 1's color, black and white.
color 0f


REM Set art dev mode to 0 by default as we're not developing art by default.
SET ARTDEVMODE==0


REM Set ALL inventory items to 0 by default if the player shouldn't start
REM the game carrying them. If you define an inventory item later in the code
REM make sure to return here and set it to 0 to avoid massive problems.
set KEY==0
set APPLE==0


REM Set up vars for controlling the apple tree event.
set ALREADYGOTAPPLE==0
set TYPEDAPPLE==0


REM Set up vars for handling the 1st spider event OR SOMETHING.
set SPIDERSEEN==0


REM Define block characters using some fuckyness for usage in art and UI
REM Use this as follows, the below code makes a line:
REM .\depends\cecho  {black}%blockwhite%&%blockwhite%&&%blockwhite%&%blockwhite%&%blockwhite%
REM the more you copy paste &%blockwhite% the longer the line gets
SET BLOCKWHITE==CALL .\depends\cecho  {white on white}W{default}{
SET BLOCKBLACK==CALL .\depends\cecho  {black on black}B{default}{
SET BLOCKRED==CALL .\depends\cecho  {red on red}R{default}{
SET BLOCKGREEN==CALL .\depends\cecho  {green on green}G{default}{
SET BLOCKYELLOW==CALL .\depends\cecho  {yellow on yellow}Y{default}{
SET BLOCKBLUE==CALL .\depends\cecho  {blue on blue}B{default}{
SET BLOCKNAVY==CALL .\depends\cecho  {navy on navy}N{default}{
SET BLOCKTEAL==CALL .\depends\cecho  {teal on teal}T{default}{
SET BLOCKMAROON==CALL .\depends\cecho  {maroon on maroon}M{default}{
SET BLOCKPURPLE==CALL .\depends\cecho  {purple on purple}P{default}{
SET BLOCKOLIVE==CALL .\depends\cecho  {olive on olive}O{default}{
SET BLOCKSILVER==CALL .\depends\cecho  {silver on silver}S{default}{
SET BLOCKGRAY==CALL .\depends\cecho  {gray on gray}G{default}{
SET BLOCKLIME==CALL .\depends\cecho  {lime on lime}L{default}{
SET BLOCKAQUA==CALL .\depends\cecho  {aqua on aqua}A{default}{
SET BLOCKFUCHISA==CALL .\depends\cecho  {fuchisa on fuchisa}F{default}{

REM Clear the screen of junk to begin presenting the initial screen.
REM Very important.
cls

REM Branding at the top of the game for the game name and "copyright".
set BRAND={purple}%ACTUALGAMENAME% ({default}{red}%FULLVERINFO%{default}{purple}) {yellow}%MOJANGNAME%{default} 
set BRAND2={teal}by REDACTED{\n}                                  (REDACTED){default}
set BRAND3=%blockred%


REM Print the branding, full version info, and the initial room description,
REM which is printed here intead of being in the look command's stuff because
REM we only want it to print once at game start.
CALL .\depends\cecho  %BRAND%
PING localhost -n 1 >NUL
CALL .\depends\cecho  %BRAND2%
PING localhost -n 1 >NUL
echo.
CALL .\depends\cecho  {white}{\n}
CALL .\depends\cecho  {black}.......................{white}V Block characters loaded: V{default}{\n}
CALL .\depends\cecho  {black}%blockwhite% & %blockred% & %blockgreen% & %blockyellow% & %blockblue% & %blocknavy% & %blockteal% & %blockmaroon% & %blockpurple% & %blockolive% & %blocksilver% & %blockgray% & %blocklime% & %blockaqua% & %blockfuchisa%
echo.
echo.

set renderweightdisplay=1

echo novi profile art dev test branch, for drawing
echo.
echo the idea of this is that you go in artmode-only.bat,
echo and draw using the block characters, under the :noviartdevtest tag
echo then you run the program and it renders the pixel art.
echo.
echo you draw by coding, with the following colors, surrounded by percentages, and   connected by ampersand signs, as seen in the example at that tag
echo.
echo blockwhite blockred blockgreen blockyellow blockblue blocknavy blockteal        blockmaroon blockpurple blockolive blocksilver blockgray blocklime blockaqua    blockfuchisa
echo.
echo the 'percent block percent's are your bricks (pixels), and the ampersands are   your mortar (glue), and are required
echo please study the example at the :noviartdevtest tag to learn more

pause

echo [REPORT] GAME BASICALLY READY AT %TIME% %DATE% >> .\logs\log.txt

REM default turn is 1, turns to jump each updateroom is also always 1.
set /A turncounter=%turncounter% + 0
set turnskip=1

REM Big ol' important one right here, UPDATEROOM. It updates many vars based
REM on the state of other vars, and must be gone to almost constantly.
REM Describe the current player status and room location, based on room ID, 
REM other vars, and update the text and stuff, everything.
REM REMEMBER!!! "goto" here EACH TIME WE GET AN INVENTORY ITEM or IF WE 
REM CHANGE ROOM LOCALE OR ANY TEXT OR DO ABSOLUTELY ANYTHING BIG
:updateroom
cls
copy /y NUL .\logs\log.txt >NUL
cls
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls
echo.
echo.
cls
echo "To start render;"
pause
cls
echo "Loading..."
echo [TURNCOUNTER] back to updateroom >> .\logs\log.txt
set renderweightdisplay=0


echo [TURNCOUNTER] TURNCOUNTER is %turncounter% >> .\logs\log.txt



REM TURNCOUNTER TURN COUNTING HAPPENS HERE, IMPORTANT FOR THINGS



REM CALL .\depends\cecho  {red}{\n}DEV: add 1 to the turncounter variable right now at this line.{\n}{#}
REM done that yay.


REM THIS IS HOW YOU COUNT UP NUMBERS IN BATCH, IT'S RIGHT HERE, THIS ONE
REM THIS TOOK ME HOURS FOR SOME REASON
set /A turncounter=%turncounter% + 1



REM default turn is 1, turns to jump each updateroom is also always 1.
setlocal enabledelayedexpansion

REM turnskip is used to determine the amount of turns we move each time this is ran (please only 1)
set turnskip==1

REM debug echo no longer needed
REM echo turnskip is: %turnskip%
REM echo turncounter is %turncounter%


REM Wait for just a tiny bit for one line.
PING localhost -n 1 >NUL
PING localhost -n 1 >NUL

REM Check weight and make it weight
if %weightgainsystem%==1 set weight=%weight%

REM Calculate which weight name we display
REM LEQ means "less than or equal to", so make sure to list these in REVERSE weight order to avoid bugs
if %weight% LEQ 1400 set WEIGHTRANKING=%weightrankSECRET%

if %weight% LEQ 1064 set WEIGHTRANKING=%weightrankSECRET%

if %weight% LEQ 771 set WEIGHTRANKING=%weightrankSECRET%

if %weight% LEQ 759 set WEIGHTRANKING=%weightranksob%

if %weight% LEQ 300 set WEIGHTRANKING=%weightranksob%

if %weight% LEQ 290 set WEIGHTRANKING=%weightrank5%

if %weight% LEQ 270 set WEIGHTRANKING=%weightrank5%

if %weight% LEQ 240 set WEIGHTRANKING=%weightrank4%

if %weight% LEQ 210 set WEIGHTRANKING=%weightrank3%

if %weight% LEQ 190 set WEIGHTRANKING=%weightrank2%

if %weight% LEQ 170 set WEIGHTRANKING=%weightrank1%

if %weight% LEQ 159 set WEIGHTRANKING=%weightrankerrorlow%

if %weight% LEQ 1 set WEIGHTRANKING=%weightrankerrorzero%

REM Combine the weight into a usable full display
set WEIGHTFULLINFO=%WEIGHT%%WEIGHTSYMBOL%

REM Combine the height into a usable full display
set HEIGHTFULLINFO=%HEIGHTFOOT%%HEIGHTSYMBOLFOOT%%HEIGHTINCH%%HEIGHTSYMBOLINCH%

REM Combine weight and height's full displays into a printable string, also with weight ranking.
set WHOLEBODYINFO=%WEIGHTFULLINFO% at %HEIGHTFULLINFO%, this makes you %WEIGHTRANKING%

REM foodlbs is used to determine the weight gain of the current food you're eating, but because we're 
REM in updateroom there is NO CURRENT FOOD, so we make it 0 until another food event.
set foodlbs==0

REM here is the section for dealing with the weight in updateroom, so we can constantly monitor and update it,
REM and so we can constantly do actions and tasks dependant on it.

REM We use renderweightdisplay to determine whether or not the player is reminded of their weight each turn.
REM This can be disabled if, for example, art or text is required to fill more space than usual.
if %renderweightdisplay%==1 CALL .\depends\cecho  {\n}{\n}You are: %wholebodyinfo%{\n}{\n}


set renderweightdisplay=%renderweightdisplay%


REM There is weight max of 760 for technical sanity reasons, because anything more would be harder to code
REM limited to avoid bugs from things being unexpectedly too high or low.
REM the weight min is 160, the weight max is 760, expect bugs if the value is forced to be out-of-range.
if %weight% GTR 771 set WEIGHTRANKING=%weightrankSECRET%
if %weight% GTR 770 set WEIGHTRANKING=%weightrankSECRET%
if %weight% EQU 771 set WEIGHTRANKING=%weightrankSECRET%
if %weight% EQU 770 set WEIGHTRANKING=%weightrankSECRET%

if %weight% GTR 759 set WEIGHTRANKING=%weightrankSECRET%
if %weight% EQU 760 set WEIGHTRANKING=%weightrankSECRET%

if %weight% GTR 771 set weight=760
if %weight% GTR 770 set weight=760
if %weight% EQU 771 set weight=760
if %weight% EQU 770 set weight=760

if %weight% GTR 761 set weight=760
if %weight% EQU 761 set weight=760
if %weight% EQU 762 set weight=760
if %weight% EQU 763 set weight=760
if %weight% EQU 764 set weight=760
if %weight% EQU 765 set weight=760
if %weight% EQU 766 set weight=760
if %weight% EQU 767 set weight=760
if %weight% EQU 768 set weight=760
if %weight% EQU 769 set weight=760
if %weight% EQU 770 set weight=760
if %weight% EQU 771 set weight=760
if %weight% EQU 772 set weight=760
if %weight% EQU 773 set weight=760
if %weight% EQU 774 set weight=760
if %weight% EQU 775 set weight=760
if %weight% EQU 776 set weight=760
if %weight% EQU 777 set weight=760

if %weight% GTR 771 set foodlbs==0
if %weight% GTR 770 set foodlbs==0
if %weight% EQU 771 set foodlbs==0
if %weight% EQU 770 set foodlbs==0

if %weight% GTR 769 set weight=760
if %weight% EQU 769 set weight=760

if %weight% GTR 769 set weightVICTORY=1
if %weight% EQU 769 set weightVICTORY=1

REM Detect game win via weight victory
if %weight% EQU 760 set weightVICTORY=1
if %weight% GTR 759 set weightVICTORY=1

if %weightVICTORY% GTR 1 goto weightending
if %weightVICTORY% EQU 1 goto weightending




REM DO THINGS BASED ON CURRENT TURNCOUNTER TURN
REM VERY IMPORTANT, USE OFTEN.

REM NEVER DO ANYTHING ON TURN 1 THOUGH, OR IT CAUSES A TEXT ISSUE..
if %turncounter% EQU 1 set /A turncounter=2
REM if we are still 1 for some reason, die.
if %turncounter% EQU 1 goto eof
REM /NEVER DO ANYTHING ON TURN 1 THOUGH, OR IT CAUSES A TEXT ISSUE../




REM Log user query for help fixing bugs.
REM only works in certain cases, we get query directly too sometimes elsewhere.
echo [USR_DID] "%query%" >> .\logs\log.txt

REM Log the user's weight as a curiosity
echo [WEIGHT] weight is "%weight%" lbs >> .\logs\log.txt


REM room descriptions based on the current room ID, goto me when room changes
if %roomid%==0 set ROOMDES1=Room ID not set or is somehow 0! FIXME
if %roomid%==0 echo "[ERROR] ROOMID IS NOW 0 - FIX THAT" >> .\logs\log.txt

if %roomid%==1 set ROOMDES1=""

if %roomid%==1 set ROOMDES2=""

if %roomid%==3 set SPIDERSEEN=1

if %roomid%==3 set ROOMDES1=Let's see... 8 legs, with the upper body of a woman and the lower body

if %roomid%==3 set ROOMDES2=of a spider: It's definitely an Arachne.

REM When you acquire OR LOSE an item, describe said item for the item screen
REM or set it's description to blank to hide it from the item screen.
if %key%==0 set KEYDESC=""
if %key%==1 set KEYDESC=A key.

if %apple%==0 set APPLEDESC=""
if %apple%==1 set APPLEDESC=An apple.





REM Check if this is the first time the room has been updated (first launch)
REM if true, go to the main room normally, if false, describe room then
REM continie to go to main room.
if %first%==0 goto mainroom
if %first%==1 goto firstdesc

REM If all else is somehow bypassed, go to mainroom regardless.
goto mainroom

REM Show the description of the initial room if this is jumped to, then
REM continue to the main room based on it's ID and other code. 
:firstdesc
echo %roomdes1%
echo %roomdes2%

REM for fox art testing only please comment out when done
goto noviartdevtest
goto mainroom

REM Code for the user-typable clear screen commands.
REM Very similar to Win7 Batch's native clear command, just with ol' familiar
REM goto updateroom after it, and some echo success text.
:clearscreen
cls
echo Okay, sure. Screen cleared.
set renderweightdisplay=1
goto updateroom

REM Code for the commands and situations that involve checking your items.
REM This works by checking if an item is acquired, then showing it's
REM description as set by stuff in updateroom. If item description isn't ""
REM OR the item var isn't 1, then nothing is shown for that particular item.
:inventorycheck

echo.
echo ________________________________________________
echo.
CALL .\depends\cecho  {yellow}You check your backpack. You find the following:{default}
echo.
if %KEY%==1 echo %KEYDESC%
if %APPLE%==1 echo %APPLEDESC%
echo ________________________________________________
echo.
set renderweightdisplay=1
goto updateroom


REM By the fact that we're at mainroom, the first automatic 'look' command, 
REM (the one after we echo the first game-starting manual echo commands for
REM the initial getting up from the ground), has definately already fired,
REM so we set first to 0 so it never happens again when we updateroom
REM or return to mainroom, to avoid duplicate roomdescs from firing off.

REM We're about to use the main text parser to grab user info and goto
REM relevant places and do the thing. This is quite self explanatory, so
REM go to where the GOTOs go to for explanations of what certain
REM words do.
:mainroom
set FIRST==0
echo.
echo.


REM We set query to NOTHING in case it somehow wasn't that already, which
REM as mentioned before helps resolve some text parsing bugs in some cases.
set QUERY=

REM We ask the question, then check for a valid response using the code below
set /P query=? 

REM Log user query for help fixing bugs.
echo [USR] query "%query%" >> .\logs\log.txt

REM If query is not defined [no input, just hitting 
REM enter, just hitting space, etc.] goto ERROR
if not defined query goto error

REM Remove all the double quotes from the query string
set query=%query:"=%

REM If character is non-alphanumeric (for most characters), goto error
for /f "delims=abcdefghijklmnopqrstuvwxyz%% " %%I in ("%query%") do (
CALL .\depends\cecho  {teal}Don't use special characters or numbers.{#}{\n}
goto novarsendback
)


REM This is the main component of the main text parser. Goto events that are
REM go-able-to by typing human redable text depending on vars and roomcode.
REM Relatively easy to understand, and as I said above,
REM go to where the GOTOs go to for explanations of what certain words do.
REM Ctrl+F (find) :inventorycheck, for example, then read the REMs.
if "%query%"=="inventory" goto inventorycheck
if "%query%"=="items" goto inventorycheck
if "%query%"=="look" goto firstdesc
if "%query%"=="i" goto inventorycheck
if "%query%"=="ls" goto inventorycheck
if "%query%"=="dir" goto inventorycheck
if "%query%"=="l" goto firstdesc
if "%query%"=="clear" goto clearscreen
if "%query%"=="cls" goto clearscreen
if "%query%"=="clr" goto clearscreen
if "%query%"=="reset" goto resetcommand
if "%query%"=="restart" goto resetcommand
if "%query%"=="reload" goto resetcommand
if "%query%"=="go back" goto gobacktoforest
if "%query%"=="apple" goto applecheck
if "%query%"=="jump" goto jumpforapple
if "%query%"=="exit" goto exit
if "%query%"=="stop" goto exit
if "%query%"=="clogq" goto clogq
if "%query%"=="bagroom" goto alreadybagroomlol
if "%query%"=="monster" goto spidergirlfirst

if "%query%"=="flirt" goto spidergirlinitialflirt

if "%query%"=="dev roomid" goto devcheckroomid

if "%query%"=="dev turncounter" goto devcheckturncounter

if "%query%"=="dev colors" goto devcolors
if "%query%"=="dev art" goto activateartdevmode
if "%query%"=="dev art list" goto activateartdevmodelist
if "%query%"=="dev bcharart fox" goto foxartdevtest
if "%query%"=="dev bcharart novi" goto noviartdevtest

if "%query%"=="dev gainweight" goto debuggainweight
if "%query%"=="dev eatfood" goto debuggainweight
if "%query%"=="dev weightgain" goto debuggainweight

if "%query%"=="weight" goto checkweightstat
if "%query%"=="height" goto checkweightstat



REM If nothing valid is typed, or something goes wrong in parsing text,
REM we go to error, which throws a generic error message and then
REM goes back to good old faithful updateroom to try to handle things nicely.
:error
CALL .\depends\cecho  {teal}You can't do that {teal}right now, maybe you never can.{#}
echo.


REM This fucker fixes the fact that in some situations query was being
REM treated as if it was a raw batch command and causing MANY MANY issues.
REM Glad I managed to figure out where query wasn't being reset quite right..
set QUERY=""

CALL .\depends\cecho  {white}

goto updateroom
exit


:errornotroom
echo [USR_ERR_NOT_ROOM] "%query%" WASN'T IN THE ROOM ATM (current room ID is '"%ROOMID%"') >> .\logs\log.txt
CALL .\depends\cecho  {teal}That {teal}can't be done / isn't here right now, maybe it won't ever be.{#}

goto updateroom
exit



REM Tell off the user for trying to enter Batch variables to cheat.
REM Because nobody likes a cheater!
:novarsendback
set QUERY=
CALL .\depends\cecho  {teal}You typed something you shouldn't. Only A - Z, alphabet{\n}character entries please.{#}

goto updateroom
exit

REM Display the weight and height stuff to the player on-demand in a less annoying way then just mentioning it every turn
:checkweightstat
set renderweightdisplay=1
if %renderweightdisplay%==1 CALL .\depends\cecho  {\n}{\n}You are: %wholebodyinfo%{\n}{\n}
set renderweightdisplay=%renderweightdisplay%
set renderweightdisplay=0
goto updateroom
exit

REM Test of the spider art that was the first real ASCII art added to the
REM game, remove this when the monster event for the spider is implemented
REM and includes this art in the real game normally.
:spiderartdevtest
color 06
echo command removed
pause
color 0f
goto updateroom


:gobacktoforest
if NOT %roomid%==3 goto errornotroom
set renderweightdisplay=1
CALL .\depends\cecho  {yellow}You move back to the earlier forest area.{default}
 echo.
echo You look around. It seems that there's a lot of trees, so that probably means you're in a forest.

echo One of them is an [apple] tree. You also see something strange nearby- having basic knowledge, you know what it is: a [monster], but it hasn't seen you yet.

set ROOMID==1
goto updateroom
exit

REM The following consists of all of the events designed for doing the apple
REM interact and jumping for events. It goes a little in-depth because
REM overkill checking for whether you're allowed to grab it and jump for it,
REM and the fact that the apple technically is added to the player
REM inventory without actually needing to be.
:applefail
if NOT %roomid%==1 goto errornotroom
CALL .\depends\cecho  {teal}Huh? Jump for what?{#}{\n}
CALL .\depends\cecho  {teal}Maybe inspect whatever you're trying to jump for before jumping for it.{#}
goto updateroom

:alreadygotapple
if NOT %roomid%==1 goto errornotroom
CALL .\depends\cecho  {teal}The other apples are far too high up the tree for you to get any more.{#}{\n}
CALL .\depends\cecho  {teal}There's nothing else you would need to jump for right now.{#}
goto updateroom

:applecheck
if NOT %roomid%==1 goto errornotroom
set TYPEDAPPLE==1
if %alreadygotapple%==1 goto alreadygotapple
if %apple%==1 goto alreadygotapple
echo The apples grow too high for you to reach as you stand, unless you do something to get a bit higher...
color 0c
type ".\art\apple.txt"
echo.
pause
set renderweightdisplay=1
color 0f
if %typedapple%==1 goto updateroom
goto updateroom

:jumpforwhat
if NOT %roomid%==1 goto errornotroom
echo Jump for what?
echo Maybe go inspect what you'd like to jump for first.
goto updateroom

:jumpforapple
if NOT %roomid%==1 goto errornotroom
if %alreadygotapple%==1 goto alreadygotapple
if %apple%==1 goto alreadygotapple
if %weight% GTR 299 goto tooheavy
if %weight% EQU 299 goto tooheavy
if %typedapple%==0 goto applefail
if %typedapple%==1 echo Crouching low, followed by a skillful jump gets you high enough to grab an      [Apple].
echo.
echo You gain an [Apple].
set renderweightdisplay=1
set ALREADYGOTAPPLE==1
set APPLE==1
set typedapple==0
goto appleeat

:appleeat
if NOT %roomid%==1 goto errornotroom
set renderweightdisplay=1
echo.
echo Putting the [Apple] to your mouth, you immediately eat it. It tastes good,      you were feeling quite hungry.
echo.
CALL .\depends\cecho  {yellow}Tip: you can check how large you are with the 'weight' command.{default}
set weight=%weight%
REM foodlbs is used to determine the weight gain of the current food you're eating
set foodlbs=1
set /a weight=%weight% + %foodlbs%

set APPLE==0
set typedapple==0
set ALREADYGOTAPPLE==1
goto updateroom


REM Here lies the code for the first monster girl encounter, the spider girl.
REM ADD MORE DESCRIPTION HERE WHEN THIS IS ACTUALLY CODED.
REM DESCRIBE HOW IT WORKS AND JUNK.
:spidergirlfirst
if %roomid%==3 goto indeeditis
if NOT %roomid%==1 goto errornotroom
set ROOMID==3
CALL .\depends\cecho  {yellow}You move a few steps towards it to get a closer look, just out of sight.{\n}{default}

echo Let's see... 8 legs, with the upper body of a woman and the lower body
CALL .\depends\cecho  of a spider: It's definitely an Arachne.
echo.

goto printspider
:resumespiderevent

echo.

echo Upon seeing it, your mind, which has barely woken up, is only thinking 
CALL .\depends\cecho  three things about her: [{red}Fight{default}] her, [{yellow}Talk{default}] to her, or... [{fuchisa}Flirt{default}] with her.
 echo.
CALL .\depends\cecho  Of course, you could decide to [{purple}go back{default}] to the forest.
goto updateroom


REM flirting with the spider~
:spidergirlinitialflirt
if %roomid%==4 goto youalreadyare
if NOT %roomid%==3 goto errornotroom
set ROOMID==4
set renderweightdisplay=1
echo DEV: ROOMID IS 4
echo.
echo You think about it for a moment, thinking that it is probably a bad 
echo idea... Then, after gathering your courage, you decide to walk
echo carefully towards the unsuspecting female Monster, and, as you are
echo close enough, you engage the conversation...: 'U-um... Hi...?'

goto updateroom


:youalreadyare
:indeeditis
CALL .\depends\cecho  {teal}You already are doing a(n) that.{#}
goto updateroom


REM Player-typable reset command, reloads the Batch file from the folder, so
REM developers can easily work on the game and type reset to see their
REM changes in an instant.
:resetcommand
color 01
cls
REM Close sounds when the game closes.
cls
echo [REPORT] "%query%" TYPED, RESTARTING GAME FROM BAT >> .\logs\log.txt
echo [REPORT] GAME WAS CLOSED BY THE GAME AT %time% %date% >> .\logs\log.txt
echo "===================================================" >> .\logs\log.txt
color 01
SET /A turncounter==1
cls
endlocal
cls
REM THE GAME CAN NO LONGER REBOOT, AND MUST BE FULLY RESTARTED MANUALLY, ELSE VARIABLES DO NOT RESET PROPERLY- WINE BUG?? (goto eof)
goto eof
exit

:devcheckroomid
echo DEV: ROOMID IS %roomid%
goto updateroom

:devcheckturncounter
echo DEV: turncounter IS %turncounter%
goto updateroom

:indeeditis
CALL .\depends\cecho  {teal}Yes, you're right- that is that.{#}
goto updateroom

:devcolors
echo Game will now be closed to give you help with using colors.
echo [USR] "dev_colors" >> .\logs\log.txt
pause
echo [REPORT] ENTERING COLOR DEVELOPMENT MODE, CLOSING GAME >> .\logs\log.txt
echo [REPORT] GAME WAS CLOSED BY THE GAME AT %time% %date% >> .\logs\log.txt
echo "===================================================" >> .\logs\log.txt
SET /A turncounter==1
endlocal
START .\depends\cecho_test_shell.bat
exit

:exit
REM This goto point is here in-case I want to add the creation of save data
REM as the player exits the game, to save the player progress when they
REM stop playing. Right now it's just Batch's regular exit command.
color 01
cls
echo [REPORT] "%query%" TYPED, NOPING GAME WITH BATCH EXIT >> .\logs\log.txt
echo [REPORT] GAME WAS CLOSED BY THE GAME AT %time% %date% >> .\logs\log.txt
echo "===================================================" >> .\logs\log.txt
SET /A turncounter==1
endlocal
:clogqout
cls
SET /A turncounter==1
endlocal
REM Close sounds when the game closes.
cls
SET /A turncounter==1
endlocal
exit



REM Debug gain weight
REM Type 'dev gainweight' in game to gain 5lbs for testing purposes.
REM devgainweight
REM devweightgain
:debuggainweight
echo Feeding...
set renderweightdisplay=1
set weight=%weight%
REM foodlbs is used to determine the weight gain of the current food you're eating
set foodlbs=5
set /a weight=%weight% + %foodlbs%

echo weight now: %weight%

echo Added 5lbs, going checkweightstat, then updateroom.
goto checkweightstat
goto updateroom
exit

:weightending
REM The weight ending, good ending.

if %weight% EQU 769 set weightVICTORY=1
if %weight% GTR 769 set weightVICTORY=1
if %weightVICTORYfirst% EQU 1 set weightVICTORY=0
set weightVICTORYfirst=1
set %weight%==760
set weightVICTORY=0
cls
color 2f
echo Congratulations~
echo You have found a secret victory :3
goto ending1cafe
exit

:ending1cafe 
set renderweightdisplay=1
if %renderweightdisplay%==1 CALL .\depends\cecho  {\n}{\n}You are: %wholebodyinfo%{\n}{\n}
set renderweightdisplay=%renderweightdisplay%
set renderweightdisplay=0
echo.
echo You end up finding yourself in the familiar cafe, happily eating a warm
echo yummy Apple Pie, drinking a cup of tea.
echo.
echo You've grown comfortable with the regulars of the cafe, and its kind staff-
echo the cutely-dressed waitresses seem to enjoy your company~
echo.
echo At this weight, it's almost impossible to move, even with help, but it's okay-
echo the waitresses and cafe owner promise they will take care of you, after all of
echo your difficult time adventuring.
echo.
echo They give you your own table at the cafe, with the big comfy seat,
echo and everything is wonderful forever more.
echo.
echo SECRET ENDING 1 - GOOD ENDING - WEIGHT GAIN
echo Maybe restart the game and try for another ending?;
pause
goto resetcommand

:clogq
SET /A turncounter==1
color 01
cls
copy /y NUL .\logs\log.txt >NUL
cls
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls
endlocal
goto clogqout
exit


:printspider
set renderweightdisplay==0
type .\art\spider.txt
goto resumespiderevent

:activateartdevmode
SET ARTDEVMODE==1
set /P artdevmode=art text file name (EXCLUDING .txt)? 
cls
type ".\art\%artdevmode%.txt"
goto updateroom

:activateartdevmodelist
cls
echo all art in folder right now:
dir ".\art\"
echo type dev art, hit enter, and then type it's name (no .txt) to view it.
goto updateroom



:foxartdevtest
set FIRST==0
echo [BCHAR_ART] "%query%" - DISPLAYING FOX ART (wait 22 seconds) >> .\logs\log.txt
cls
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blockblack%&%blockblack%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blocksilver%&%blocksilver%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blocksilver%&%blocksilver%&%blockwhite%&%blocksilver%&%blocksilver%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%

goto updateroom


:noviartdevtest
set FIRST==0
echo [BCHAR_ART] "%query%" - DISPLAYING ART (wait 22 seconds) >> .\logs\log.txt
copy /y NUL .\logs\log.txt >NUL
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls



%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blockblack%&%blockblack%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blockfuchisa%&%blockfuchisa%&%blockfuchisa%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blockblack%&%blocksilver%&%blocksilver%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blocksilver%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blocksilver%&%blocksilver%&%blockwhite%&%blocksilver%&%blocksilver%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%
%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockmaroon%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockgray%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%&%blockwhite%



echo.
echo.
pause
cls
copy /y NUL .\logs\log.txt >NUL
cls
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls
goto eof
goto updateroom


REM This goto point is...
:alreadybagroomlol
goto eof

REM Generic error for if you're too fatty to manage an action, to be gone to when this applies.
:tooheavy
echo You try, but it seems you're too heavy to manage that. Oh well.
goto updateroom

REM End of file, exits the game if encountered or gone to.
:eof
cls
echo The engine will now crash. 
echo.
echo If you need to make changes to the art, please edit under the :noviartdevtest   tag in artmode-only.bat
echo.
echo If you didn't take a screenshot that you meant to take, or anything, you should re-start it and do that. That's kinda what this program is for.
echo.
echo Program finished
echo..
pause
color 01
cls
copy /y NUL .\logs\log.txt >NUL
cls
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls
cls
SET /A turncounter==1
cls
cls
endlocal
cls
cls
copy /y NUL .\logs\log.txt >NUL
cls
echo f | xcopy log.txt .\logs\log.txt /S /Y /D /Y
cls
exit
