# (consider remaking in pygame)

import os
 
def clear_screen():
    os.system('clear')
 
for i in range(48):
    print("")
clear_screen()
print("CTRL+C IN YOUR BASH TERMINAL TO STOP ALL OF THIS.")
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

width, height= pyautogui.size()
print("whole screen width and height")
print(width)
print(height)

# set up the screen
SCREEN_NUM = 0
SCREENS = pyglet.canvas.Display().get_screens()
SCREEN = SCREENS[SCREEN_NUM]

def center_on_screen(self):
            """Centers the window on the screen."""
            _left = 0 // 2 - self.width // 2
            _top = 0 // 2 - self.height // 2
            self.set_location(_left, _top)
    
# Creating MainGame class
class MainGame(arcade.Window):
    def __init__(self):
        super().__init__(600, 600, title="DnD dungeon layout maker")
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
        
        arcade.draw_texture_rectangle(300, 300, 600,
                                      600, self.background)
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
                arcade.draw_texture_rectangle(300, 300, 600,
                                      600, self.background)

    # Creating function to check the mouse clicks
    def on_mouse_press(self, x, y, button, modifiers):
        print("")
        print("ACTION!")
        print("Mouse button is pressed")
        print("")
        center_on_screen(self)
        arcade.draw_rectangle_filled(self.x, self.y, 29, 29, arcade.color.WHITE, 0)
        arcade.finish_render()
        # Screenshot the screen so it can build on itself
        print("Take a screenshot now to use as the buffer!")
        viewinfo = arcade.get_viewport()
        print('viewinfo =')
        print(viewinfo)
        print("")
        image = ImageGrab.grab(bbox=(1,29,601,629))
        image.save('gridback.png')
        #==========#
        print("Now, right here! Make it so the background changes to what is now written to disk!")
        shutil.copyfile('gridback.png', 'gridbacknew.png')
        self.background = None
        self.background = arcade.load_texture("gridbacknew.png")
        arcade.draw_texture_rectangle(300, 300, 600,
                                      600, self.background)
        arcade.start_render()
        exit()
        #==========#
        return  

        

# Calling MainGame class
MainGame()
arcade.run()

