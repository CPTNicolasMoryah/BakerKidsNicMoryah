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
stars = 6

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen

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

--print ("system.DocumentsDirectory = " .. system.DocumentsDirectory)
starsAsString = stars .. ""

--[[
-- Path for the file to write
path = system.pathForFile( "coinsFile.txt", system.DocumentsDirectory )

file, errorString = io.open( path, "w" )
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Write data to file
    file:write( starsAsString )
    -- Close the file handle
    io.close( file )
end
 
file = nil

]]--

-- Get path for file "data.txt" in the documents directory
path = system.pathForFile( "coinsFile.txt", system.DocumentsDirectory )
 
-- Open the file from the path
file, reason = io.open( path, "r" )
 
if file then
    -- File exists; read its contents into a string
    local contents = file:read( "*a" )
    print( "Contents of " .. path .. "\n" .. contents )

    stars = tonumber(contents)

    print ("***New stars = " .. stars)

     
else
    -- File open failed; output the reason
    print( "File open failed: " .. reason )
 
    -- Create file since it doesn't exist yet
    file = io.open( path, "w" )
 
    if file then
        print( "Created file" )
    else
        print( "Create file failed!" )
    end
 
    file:write( stars .. "")

 end
  
io.close( file )
--composer.gotoScene( "characterselectscreen" )
