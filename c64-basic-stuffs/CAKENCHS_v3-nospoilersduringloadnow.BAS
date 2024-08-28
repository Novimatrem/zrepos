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

12 print "i love you"
13 print ""
14 print "what is your fave food?: cake or cheese?"
30 input ""; query$
40 if query$ = "cake" then goto 60
41 if query$ = "cheese" then goto 70

rem error handling for invalid input
55 if query$ NOT = "cake" then goto 72
56 if query$ NOT = "cheese" then goto 72
57 print "dummy thats not cake or cheese"
58 goto 4

59 goto 999

60 print "cake is very yummy, i like it"
61 goto 4

70 print "some kinds of cheese is delicious"
71 goto 4

73 print "for some reason this not seen"
74 goto 4

75 print chr$(147)
999 print "ERROR, FUCKED"
1000 print chr$(147)

1001 print chr$(147)









poke 646,0
run

