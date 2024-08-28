@echo off
cd %cd%

copy /y gridback_orig.png gridbacknew.png
copy /y gridback_orig.png gridback.png

echo "Done! Launching..."

:top
cls
python dnd-map-plotter-pixels.py
cls
goto top
