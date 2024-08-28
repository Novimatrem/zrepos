print chr$(147)
poke 646,0
poke 53281,0
print chr$(147)
poke 53280,0
print chr$(147)
poke 53281,0
poke 646,0
poke 53281,0
print chr$(147)
poke 53281,0
poke 53280,0
poke 53281,0
print chr$(147)
poke 646,0
print chr$(147)
poke 646,0
print chr$(147)
poke 53281,0
poke 646,0
print chr$(147)
poke 53280,0
poke 646,0
poke 53280,0
poke 646,0
print chr$(147)
poke 646,0
print chr$(147)
poke 53272,23
print chr$(147)
poke 646,0

rem ensure caps lock is off, open vice x64 c64 emulator, copy this entire script with ctrl+a, ctrl+c, then go to the edit > paste in vice
print chr$(147)

rem game code starts here

print chr$(147)
sleep 2
poke 646,0

rem below poke clears screen
2 print chr$(147)
print chr$(147)

3 query$="null"
query$="null"

rem main game parser loop starts here
4 rem resume point here


rem poke 53272,23 sets to mixed-case font automatically
5 poke 53272,23

rem below poke sets screen inner background to black
6 poke 53281,0

rem below poke sets screen border to black
7 poke 53280,0

rem below command sets text color to white
8 poke 646,1




rem add new line for spacing
11 print ""

12 print "gamename main menu"
13 print ""
14 print "Welcome to gamename- type start to begin"
15 print "You can also type option2 to PLACEHOLDER"
30 input ""; query$
40 if query$ = "start" then goto 60
41 if query$ = "option2" then goto 70

rem error handling for invalid input
55 if query$ NOT = "start" then goto 72
56 if query$ NOT = "option2" then goto 72
57 print "Invalid entry, type start or option2"
58 goto 4

60 print "here is an option"
61 goto 1024

70 print "here is another option"
71 goto 2048



rem ===========================================================================

1024 print "line ten twenty four"
1025 print "code goes here"
rem ===========================================================================


1536 print "script has gone runabout, goto end"
1537 goto 6144


rem ===========================================================================

2048 print "line twenty forty eight"
2049 print "code goes here"
rem ===========================================================================


2560 print "script has gone runabout, goto end"
2561 goto 6144



6144 print "END OF FILE"

rem THE FOLLOWING TWO LINES NEED TO BE AT THE ABSOLUTE END OF THE TEXT FILE
poke 646,0
run

