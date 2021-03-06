-----------------------------------------------------------------------------------------
-- YouLose
-- Created by: Nic Riscalas
-- Date: 12,5,19
-- Description: This shows the player that they lost the game and plays a booing sound.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Calling Composer Library
local composer = require( "composer" )

local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "YouLose4"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- local variables for the scene
local bkg
local leve2button
local mainmenu
local nextlevel
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function Level4ScreenTransition( )
    composer.removeScene("level4_screen")
    composer.gotoScene("level4_screen")
end 
local function mainmenuTransition()
    composer.removeScene("level4_screen")
   composer.gotoScene( "main_menu" )
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Display background
    bkg = display.newImage("Images/you_lost.png")
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight
    -----------------------------------------------------------------------------------------     

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg )
    ----------------------------------------------------------------------------------------
--BUTTONS AND WIDGETS
---------------------------------------------------------------------------------------
    level2button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*5/8,
            y = display.contentHeight*7/8,
            

            -- Insert the images here
            defaultFile = "Images/TRY AGAIN UNPRESSED.png",
            overFile = "Images/TRY AGAIN PRESSED.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level4ScreenTransition          
        } )
    mainmenu = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*10/12,
            

            -- Insert the images here
            defaultFile = "Images/homeLost.png",
            overFile = "Images/homeWon.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = mainmenuTransition          
        } )
sceneGroup:insert( level2button )
sceneGroup:insert( mainmenu ) 
level2button:scale(0.4,0.3)
end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        UpdateStars()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene

