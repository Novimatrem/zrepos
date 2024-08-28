from __future__ import print_function
# (consider remaking in pygame)

import os
import pathlib


 
def clear_screen():
    os.system('cls')
 
for i in range(48):
    print("")
clear_screen()
print("CLOSE THIS TERMINAL TO STOP THE PROGRAM.")
print("YOUR FINAL FILE WILL BE SAVED AS gridback.png")
print("")
print("PROGRAM STARTS...")
print("")

# Importing modules
import arcade
import PIL.Image
import PIL.ImageOps
import PIL.ImageDraw
import pyautogui
from PIL import ImageGrab
import pyglet
import shutil
from os.path import exists
global inp

import tkinter as tk

from pathlib import Path
global color
global colour
global storedcolour
print("YOUR AWESOME COLOUR IS!")
file = open("colorchoice.txt")
print(file.read())
file.close()

text_file = open("colorchoice.txt", "r")
global data
#read whole file to a string
data = text_file.read()

#close file
text_file.close()
str(data)
print("data equals V")
print(data)
global storedcolour
# All you have to do is get data into storedcolour
print("All you have to do is get data into storedcolour")
storedcolour=data


my_file = Path("changecolor.txt")
if os.path.isfile(my_file):
    print("the user is trying to change colour now")
    # Top level window
    frame = tk.Tk()
    frame.title("Enter colour in pure HTML notation - for example #ff0000 is red.")
    frame.geometry('800x150')
        # Function for getting Input
        # from textbox and printing it 
        # at label widget

    lbl=""
    def printInput():
            global inp
            inp = inputtxt.get(1.0, "end-1c")
            print(inp)
            inp=str(inp)
            file_exists = os.path.exists('colorchoice.txt')
            pickedcheck=print(file_exists)
            print("PICKED CHECK EQUALS")
            print(pickedcheck)
            inputtxt.quit()
            

        # TextBox Creation
    inputtxt = tk.Text(frame,
        height = 5,
        width = 20)

    inputtxt.pack()

        # Button Creation
    printButton = tk.Button(frame,
        text = "Submit after typing the exact colour name, do NOT press Enter/Return.",
        command = printInput)
    printButton.pack()

        # Label Creation
    lbl = tk.Label(frame, text = "")
    lbl.pack()
    frame.mainloop()
    print("At this safe space, inp is currently this:")
    print(inp)
    with open('inp.txt', 'w') as f:
            f.write(inp)
    file_to_rem = pathlib.Path("changecolor.txt")
    file_to_rem.unlink()
    with open('colorchoice.txt') as f:
        color = f.readlines()
        f.close()
    
my_file = Path("colorchoice.txt")
if not my_file.is_file():

        # Top level window
        frame = tk.Tk()
        frame.title("Enter colour in pure HTML notation - for example #ff0000 is red.")
        frame.geometry('800x150')
        # Function for getting Input
        # from textbox and printing it 
        # at label widget

        lbl=""
        def printInput():
            global inp
            inp = inputtxt.get(1.0, "end-1c")
            print(inp)
            inp=str(inp)
            file_exists = os.path.exists('colorchoice.txt')
            pickedcheck=print(file_exists)
            print("PICKED CHECK EQUALS")
            print(pickedcheck)
            inputtxt.quit()
            

        # TextBox Creation
        inputtxt = tk.Text(frame,
        height = 5,
        width = 20)

        inputtxt.pack()

        # Button Creation
        printButton = tk.Button(frame,
        text = "Submit after typing the exact colour name, do NOT press Enter/Return.",
        command = printInput)
        printButton.pack()

        # Label Creation
        lbl = tk.Label(frame, text = "")
        lbl.pack()
        frame.mainloop()
        print("At this safe space, inp is currently this:")
        print(inp)
        with open('inp.txt', 'w') as f:
            f.write(inp)

global loadedvalueofinp
try:
    inp
except NameError:
    f = open('inp.txt', 'r')
    loadedvalueofinp=print(f.read())
    f.close()
    from pathlib import Path
    loadedvalueofinp = Path('inp.txt').read_text()
else:
    print("sure, it was defined.")
print(storedcolour)

#turn storedcolour into hex again and then put it below in that inp




inp=loadedvalueofinp
if loadedvalueofinp == "None":
    print("imp file contains None")

if loadedvalueofinp == "":
    print("imp file contains nothing")

print("loadedvalueofinp is set to")
print(loadedvalueofinp)

# here ^^^^

#text_file = open("inp.txt", "w")
#text_file.write(str(inp))
text_file.close()

# we need to load the current value of inp from its file right here.
print("we need to load the current value of inp from its file right here.")
print("")


width, height= pyautogui.size()
print("whole screen width and height")
print(width)
print(height)

# set up the screen
SCREEN_NUM = 0
SCREENS = pyglet.canvas.Display().get_screens()
SCREEN = SCREENS[SCREEN_NUM]

print("selected colour is")
print(inp)
inp=inp
selectedcolor=str(inp)


# Convert HTML-like colour hex-code to integer triple tuple
# E.g.: "#892da0" -> ( 137, 45, 160 )
def hexToColour( hash_colour ):
    """Convert a HTML-hexadecimal colour string to an RGB triple-tuple"""
    red   = int( hash_colour[1:3], 16 )
    green = int( hash_colour[3:5], 16 )
    blue  = int( hash_colour[5:7], 16 )
    return ( red, green, blue )


colour = hexToColour( selectedcolor )
global colorsave

def center_on_screen(self):
            """Centers the window on the screen."""
            _left = 1154 // 2 - self.width // 2
            _top = 706 // 2 - self.height // 2
            self.set_location(_left, _top)
    
# Creating MainGame class
class MainGame(arcade.Window):
    def __init__(self):
        super().__init__(1152, 648, title="DnD dungeon layout maker v2, press C to chose colour.")
        center_on_screen(self)
        # Starting location of player
        self.x = 10242048
        self.y = 10242048
        center_on_screen(self)

    # Creating on_draw() function to draw on the screen
    def on_draw(self):
        arcade.start_render()
        # Loading the background image
        self.background = arcade.load_texture("gridback.png")
        # Drawing the background image
        
        arcade.draw_texture_rectangle(576, 324, 1152,
                                      648, self.background)
        # Drawing our cursor
        arcade.draw_circle_filled(self.x, self.y, 5, arcade.color.GREEN)
        # Draw a filled in rectangle
##        arcade.draw_rectangle_filled(420, 100, 45, 65, arcade.color.BLUSH)

    # Creating function to check the position
    # of the mouse
    def on_mouse_motion(self, x, y, dx, dy):
                """
                Called whenever the mouse moves.
                """
                self.x = x
                self.y = y
##                print(SCREENS)
##                print('underscoreleftis' + _left)
                center_on_screen(self)
                self.background = arcade.load_texture("gridback.png")
                arcade.draw_texture_rectangle(576, 324, 1152,
                                      648, self.background)

    def on_key_press(self, key, modifiers):
        """Called whenever a key is pressed."""

        if key == arcade.key.C:
            f = open("changecolor.txt", "a")
            f.close()
            os.system("taskkill /im python.exe")
            sys.exit()
            os.exit()
            exit()
            
    # Creating function to check the mouse clicks
    def on_mouse_press(self, x, y, button, modifiers):
        print("")
        print("ACTION!")
        print("Mouse button is pressed")
        print("")
        center_on_screen(self)
        print("ATTEMPTING TO PAINT WITH CUSTOM COLOR OF:")
        print(selectedcolor)
        print("cs variable equals to")
        print(str(colour))
        colorsave=str(colour)
        
        f = open("colorchoice.txt", "w")
        file = open("colorchoice.txt","w")
        f.close()

        L = [colorsave]
        file.write(colorsave)
        file.close()


        arcade.draw_rectangle_filled(self.x, self.y, 30, 30, colour)
        arcade.finish_render()
        # Screenshot the screen so it can build on itself
        print("Take a screenshot now to use as the buffer!")
        
        viewinfo = arcade.get_viewport()
        print('viewinfo =')
        print(viewinfo)
        print("")
        image = ImageGrab.grab(bbox=(1,29,1153,677))
        image.save('gridback.png')
        import os
        os.system("taskkill /im python.exe")
        sys.exit()
        os.exit()
        exit()
        #==========#
        print("Now, right here! Make it so the background changes to what is now written to disk!")
        shutil.copyfile('gridback.png', 'gridbacknew.png')
        self.background = None
        self.background = arcade.load_texture("gridbacknew.png")
        arcade.draw_texture_rectangle(576, 324, 1152,
                                      648, self.background)
        arcade.start_render()
        exit()
        #==========#
        return  

# arcade.draw_texture_rectangle(texture.width//2, texture.height//2, texture.width, texture.height, texture, 0)

# Calling MainGame class
MainGame()
arcade.run()

