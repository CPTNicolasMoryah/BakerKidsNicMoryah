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
stars = 0

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen

--composer.gotoScene( "level3_screen" )

--composer.gotoScene( "level4_screen" )
--composer.gotoScene( "level1_screen" )
composer.gotoScene( "splashscreen" )
--composer.gotoScene( "level3_screen" )
--composer.gotoScene( "level4_screen" )
--composer.gotoScene( "level2_screen" )
--composer.gotoScene( "YouLose" )
--composer.gotoScene( "YouWin1" )
--composer.gotoScene( "PauseScreen" )
--composer.gotoScene( "main_menu" )
--composer.gotoScene( "instructions" )
--composer.gotoScene( "credits_screen" )
--composer.gotoScene( "characterselectscreen" )