# well, progress has been made, but i still need to figure out actually replacing the background with a new one without it caching.
#
# right now the actual png file reflects the correct changes, but these are not displayed back to the screen.
#
#if worst comes to worst, i could just render a texture over the whole screen which does the same purpose, *OR* if worst *REALLY* comes to
# worst, i could make python generate a file with a sequential filename and then set that as the background, so there's no cache existing for that file.
#
# i need to figure out how to clear a currently set arcade background, as my next step, i think.

import os

import time
 
def clear_screen():
    os.system('clear')
 
for i in range(48):
    print("")
clear_screen()
print("py file starts execution.")
time.sleep(1)
print("")
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
print("")

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
        global count
        global countalt
        count = 1
        countalt = 1
        # Starting location of player
        self.x = 10242048
        self.y = 10242048
        center_on_screen(self)

    # Creating on_draw() function to draw on the screen
    def on_draw(self):
        global count
        global countalt
        if count == 1:
            count = countalt + 1
            countstr = str(countalt)
        else:
            countalt = countalt + 1
            countstr = str(countalt)
        print("Frame: " + countstr)
        arcade.cleanup_texture_cache()
        arcade.start_render()
        arcade.cleanup_texture_cache()
        # Loading the background image
        arcade.cleanup_texture_cache()
        self.background = arcade.load_texture("gridback.png")
        self.background = arcade.load_texture("gridbacknew.png")
        arcade.cleanup_texture_cache()
        # Drawing the background image
        arcade.cleanup_texture_cache()
        arcade.draw_texture_rectangle(300, 300, 600,
                                      600, self.background)
        arcade.cleanup_texture_cache()
        # Drawing our cursor
        arcade.draw_circle_filled(self.x, self.y, 5, arcade.color.GREEN)
        arcade.cleanup_texture_cache()
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
                arcade.finish_render()
                

    # Creating function to check the mouse clicks
    def on_mouse_press(self, x, y, button, modifiers):
        print("")
        print("ACTION!")
        print("Mouse button is pressed")
        arcade.cleanup_texture_cache()
        center_on_screen(self)
        arcade.draw_rectangle_filled(self.x, self.y, 29, 29, arcade.color.WHITE, 0)
        
        
        arcade.cleanup_texture_cache()
        viewinfo = arcade.get_viewport()
        image = ImageGrab.grab(bbox=(1,29,601,629))
        image.save('gridback.png')
        arcade.cleanup_texture_cache()
        #==========#
        print("")
        arcade.cleanup_texture_cache()
        shutil.copyfile('gridback.png', 'gridbacknew.png')
        arcade.cleanup_texture_cache()
        self.background = None
        arcade.cleanup_texture_cache()
        self.background = arcade.load_texture("gridbacknew.png")
        arcade.cleanup_texture_cache()
        arcade.finish_render()
        arcade.draw_texture_rectangle(300, 300, 600,
                                      600, self.background)
        # At this point right here is where the square is actually rendered, you need to take a screenshot here to replace all the others.
        print("RENDING SQUARE!")
        print("TAKING SCREENSHOT!")
        
        image = ImageGrab.grab(bbox=(1,29,601,629))
        image.save('gridback.png')
        image = ImageGrab.grab(bbox=(1,29,601,629))
        image.save('gridbacknew.png')

        time.sleep(0.5)
        
        # Now set it as the background.
        
        # Should be good now.
        arcade.cleanup_texture_cache()
        arcade.start_render()
        arcade.cleanup_texture_cache()
        self.background = arcade.load_texture("gridbacknew.png")
        arcade.draw_texture_rectangle(300, 300, 600,
                                      600, self.background)
        arcade.finish_render()
        arcade.cleanup_texture_cache()
        arcade.View()
        print("")
        print("Reached end of re-rend attempt. If it's working, your changes should be         reflected, and the green cursor should still move with yours.")
        print("")
        
        #exit()
        #==========#
        return  

        

# Calling MainGame class
MainGame()
arcade.run()

