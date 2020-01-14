  
-----------------------------------------------------------------------------------------
--
-- instructions
-- Created by: Nic R
-- Date: Nov, 20, 2019
-- Description: This is the credits page, displaying a back button to the main menu.
-----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--GLOBAL VARIABLES
---------------------------------------------------------------------------------------
chef1 = false
level2done = false
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "characterselectscreen"

-- Creating Scene Object
scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg_image
local backButton
local lock1
local lock2
local lock3
local lock4
local startext1
local startext2
local startext3
local startext4
local star1
local star2
local star3
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "fromRight", time = 500})
end

local function clickchef(touch)
    chef1 = true
    if (level2done == false) then
        composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
    else
        composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
    end
end

local function clickcashier(touch)
    Cashier1 = true
    if (level2done == false) then
        composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
    end
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------
    chef = display.newRect(0,0,0,0)
    chef.height = 350
    chef.width = 100
    chef.x = 120
    chef.y = 400

    Cashier = display.newRect(0,0,0,0)
    Cashier.height = 350
    Cashier.width = 100
    Cashier.x = 360
    Cashier.y = 400
    -- Insert the background image and set it to the center of the screen
    bkg = display.newImageRect("Images/character screen.png", display.contentWidth, display.contentHeight)
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight


    lock1 = display.newImageRect("Images/lock.png", 200, 200) 
    lock1.x = 120
    lock1.y = 400

    startext1 = display.newText("3", 200, 200, Arial, 35) 
    startext1.x = 100
    startext1.y = 400 

    star1 = display.newImage("Images/star1.png")
    star1.x = 140
    star1.y = 400
    star1.width = 35
    star1.height = 35

    star2 = display.newImage("Images/star2.png")
    star2.x = display.contentWidth/2
    star2.y = 450
    star2.width = 200
    star2.height = 200

    star3 = display.newImage("Images/star3.png")
    star3.x = display.contentWidth*6/8
    star3.y = 450
    star3.width = 200
    star3.height = 200
    

    -- Associating display objects with this scene 
    sceneGroup:insert( Cashier )
    sceneGroup:insert( chef )
    sceneGroup:insert( bkg )
    sceneGroup:insert(lock1)
    sceneGroup:insert( star3 )
    sceneGroup:insert( star2 )
    sceneGroup:insert( star1 )



    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*7/8,
        y = display.contentHeight*15/16,

        -- Setting Dimensions
        -- width = 1000,
        -- height = 106,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonPressedMoryah.png",
        overFile = "Images/BackButtonUnpressedMoryah.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -----------------------------------------------------------------------------------------
     --set the size of the button
    backButton:scale(0.7,0.7)
    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
    
end --function scene:create( event )

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
        chef:addEventListener("touch", clickchef)
        Cashier:addEventListener("touch", clickcashier)
    end

end -- function scene:show( event )

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

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end --function scene:destroy( event )

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