-- Title: main.lua
-- Name: Nic riscalas
-- Course: ICS2O/3C
-- This program This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
-- HIDE THE STATUS BAR

----------------------------------------------------------------------------------------
--GLOBAL VARIABLES
----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
function UpdateStars()

-- Get path for file "data.txt" in the documents directory
path = system.pathForFile( "coinsFile.txt", system.DocumentsDirectory )
 
-- Open the file from the path
file, reason = io.open( path, "r" )
 
if file then
	print ("***File exists")
    -- File exists; read its contents into a string
    local starsAsString = file:read( "*a" )
    print( "Contents of " .. path .. "\n" .. starsAsString )


    stars = tonumber(starsAsString)


    print ("***New stars = " .. stars)

     
else
	print ("***File does not exist")
    -- File open failed; output the reason
    print( "File open failed: " .. reason )
 
    -- Create file since it doesn't exist yet
    file = io.open( path, "w" )
    stars = 0
 
    if file then
        print( "Created file" )
    else
        print( "Create file failed!" )
    end
 
    file:write( stars .. "")

 end
  
io.close( file )

end

UpdateStars()

--composer.gotoScene( "level3_screen" )

--composer.gotoScene( "level4_screen" )
--composer.gotoScene( "level1_screen" )
--composer.gotoScene( "splashscreen" )
--composer.gotoScene( "level3_screen" )
--composer.gotoScene( "level4_screen" )
--composer.gotoScene( "level2_screen" )
--composer.gotoScene( "YouLose" )
--composer.gotoScene( "YouWin2" )
--composer.gotoScene( "PauseScreen" )
composer.gotoScene( "main_menu" )
--composer.gotoScene( "instructions" )
--composer.gotoScene( "credits_screen" )
--composer.gotoScene( "characterselectscreen" )

--------------

--composer.gotoScene( "characterselectscreen" )
