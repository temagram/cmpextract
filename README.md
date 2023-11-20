# cmpextract
An AutoHotKey script to automate extraction of textures of the proprietary .cmp format. It works by automatically loading all textures within a specified directory sequentially with CmpView and taking screenshots of the loaded textures. The screenshots are saved to a specified directory and named neatly according to a naming scheme. If a .cmp files consists of multiple textures, the program stitches them together.

Before starting the script:
Open CMPView and navigate to the first file of the directory containing the .cmp files you want to extract. Maximize CMPView. (Unfortunately this script only works on screens with a 1920x1080 resolution, due to the script taking screenshots of a specific region of the screen).

