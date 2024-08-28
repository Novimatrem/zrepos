poke 53272,23
1 poke 53272,23

rem ensure caps lock is off, open vice x64 c64 emulator, copy this entire script with ctrl+a, ctrl+c, then go to the edit > paste in vice, press enter, & enter run

rem game code starts here

rem poke 53272,23 sets to mixed-case font automatically
5 poke 53272,23

rem below poke sets screen inner background to black
6 poke 53281,0

rem below poke sets screen border to black
7 poke 53280,0

rem below command sets text color to white
8 poke 646,1

rem below poke clears screen
9 print chr$(147)

10 print "i love you"
30 input "what is your fave food?: cake or cheese"; query$
40 if query$ = "cake" then goto 60
41 if query$ = "cheese" then goto 70

rem error handling for invalid input
55 if query$ NOT = "cake" then goto 72
56 if query$ NOT = "cheese" then goto 72
57 print "dummy thats not cake or cheese"
58 goto 999


60 print "cake is very yummy, i like it"
61 goto 999

70 print "some kinds of cheese is delicious"
71 goto 999

73 print "for some reason this not seen"
74 goto 999

999 print "end of game, type run to retry"


