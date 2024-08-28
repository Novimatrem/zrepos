# futa-every-word-bot-for-diaspora_macOS-10-6-snow-leopard-applescript
# dev help 1: https://www.davidheidelberger.com/2013/05/13/macros-with-applescript/
# dev help 2 (codes): https://eastmanreference.com/complete-list-of-applescript-key-codes
# remember: set the mac to never go off/to sleep, never have it be interrupted
# have firefox open, on SPECIFICALLY THIS PAGE: https://iviv.hu/status_messages/new , 
# with the main posting box selected, cursor flashing.
#
# (ensure you make it be using the Mobile version of disapora, normal one no worky on old browser)
# (it's set by a cookie so you only have to make it use mobile once, if the posting box shows up you good)
#
tell application "TenSixFox"
	activate
	tell application "System Events"
		global thisOne
		global wordList
		# random word gen from dict
		do shell script "bash /Users/novi/Documents/few-bot-diaspora-mac10-6/randwordgen.sh"
		delay 0.5
		delay 20
		delay 5
		delay 10
		key code 96
		delay 5
		delay 10
		key code 15 using {command down} # refresh (command+R)
		delay 5
		delay 20
		# clear what may be already in the box if the internet dropped the last time we tried to post
		delay 10
		key code 0 using {command down} # select all (command+A)
		delay 0.1
		key code 51 # backspace
		delay 0.1 #Start doing the text below this
		# Randomly pull a word from that text file next to script, and use it in the next bit
		set thisOne to {read POSIX file "/Users/novi/Documents/few-bot-diaspora-mac10-6/randword.txt"}
		log "thisOne"
		#activate
		#display dialog thisOne
		#activate
		set wordList to thisOne
		set myWord to some item of wordList
		tell application "System Events" to keystroke myWord
		delay 0.1
		delay 0.5
		key code 49 # space
		delay 0.1
		key code 3 # f
		delay 0.1
		key code 32 # u
		delay 0.1
		key code 17 # t
		delay 0.1
		key code 0 # a
		delay 0.1
		delay 0.5
		key code 48 # tab
		delay 0.1
		key code 48 # tab
		delay 0.1
		key code 36 # enter on POST button
		delay 20
		delay 20
		delay 10
		# now we have to get back to the posting UI, which is tab tab tab tab enter
		delay 0.1
		key code 48 # tab
		delay 0.1
		delay 0.1
		key code 48 # tab
		delay 0.1
		delay 0.1
		key code 48 # tab
		delay 0.1
		delay 0.1
		key code 48 # tab
		delay 0.1
		key code 36 # enter on compose button
		delay 0.1
		delay 0.5
		delay 20
		delay 5
		delay 10
		key code 96
		delay 5
		delay 10
		key code 15 using {command down} # refresh (command+R)
		delay 5
		delay 20
		delay 10
	end tell
end tell
