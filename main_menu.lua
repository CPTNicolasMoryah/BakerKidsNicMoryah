-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Moryah
-- Date: nov. 21, 2019
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
--GLOBAL VARIABLES
---------------------------------------------------------------------------------------
level2done = false
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton
local characterscreenButton 

local muteButton
local unmuteButton
-----------------------------------------------------------------------------------------
local bkgMusic = audio.loadSound("Sounds/mainmenusound.mp3",{channel = 2} )
local bkgMusicChannel
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function Mute(touch)
    print("*****muted")
    if (touch.phase == "ended") then
        -- pause the Sound
        audio.pause(bkgMusicChannel)
        -- set the boolean variable to be false (sound is now muted)
        SOUNDON = true
        -- hide the mute button
        muteButton.isVisible = true
        -- make the unmute button visible
        unmuteButton.isVisible = false
    end
end

local function Unmute(touch)
    print("***unmute")
    if (touch.phase == "ended") then
        -- pause the Sound
        audio.resume(bkgMusicChannel)
        -- set the boolean variable to be false (sound is now muted)
        SOUNDON = false
        -- hide the mute button
        muteButton.isVisible = false
        -- make the unmute button visible
        unmuteButton.isVisible = true
    end
end

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "crossFade", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
--local function Level1ScreenTransition( )
  --  composer.gotoScene( "level1_screen", {effect = "crossFade", time = 500})
--end   

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 
local function LevelSelectTransition( )
    composer.gotoScene("level_select1", {effect = "crossFade", time = 500})
end

-----------------------------------------------------------------------------------------

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 
local function InstructionsTransition( )
    composer.gotoScene("instructions", {effect = "crossFade", time = 500})
end

local function characterscreentransition( )
    composer.gotoScene("characterselectscreen", {effect = "crossFade", time = 500})
end

local function displaystars()
    starstext.text = "= "..stars
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuMoryah.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    starstext = display.newText("= 0",575,110, nil, 50)
    starstext:setTextColor(0,0,0)

    star1 = display.newImage("Images/star1.png")
    star1.x = 450
    star1.y = 110
    star1.width = 100
    star1.height = 100
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*4/8,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnPressedNicR.png", 170, 120,
            overFile = "Images/PlayButtonPressedNicR.png", 170, 120,

            -- When the button is released, call the level select transition function
            onRelease = LevelSelectTransition        
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 884,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressedMoryah.png", 170, 120,
            overFile = "Images/CreditsButtonPressedMoryah.png", 170, 120,

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

    -----------------------------------------------------------------------------------------

    -- ADD INSTRUCTIONS BUTTON WIDGET
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 140,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressedMoryah.png", 170, 120,
            overFile = "Images/InstructionsButtonPressedMoryah.png", 170, 120,

            -- When the button is released, call the Credits transition function
            onRelease = InstructionsTransition
        } ) 

    characterscreenButton = widget.newButton(
    {
        x = 140,
        y = display.contentHeight*2/10,

        width = 150,
        height = 150,

        defaultFile = "Images/characterselectbutton.png", 170, 170,
        overFile = "Images/characterselectbutton.png", 170, 170,

        onRelease = characterscreentransition
    } ) 
    unmuteButton = display.newImageRect("Images/unmuteButton.png", 90, 90)
    unmuteButton.x = 900
    unmuteButton.y = 148
    unmuteButton.isVisible = false
    -----------------------------------------------------------------------------------------
    muteButton = display.newImageRect("Images/muteButton.png", 90, 90)
    muteButton.x = 900
    muteButton.y = 148
    muteButton.isVisible = true

    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )
    sceneGroup:insert( characterscreenButton )
    sceneGroup:insert( starstext )
    sceneGroup:insert( star1 )
    

end -- function scene:create( event )   

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then

        -- The function that will go to the main menu 
        displaystars()
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    elseif ( phase == "did" ) then

        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.   
        unmuteButton:addEventListener("touch", Mute)
        muteButton:addEventListener("touch", Unmute)

        if ( SOUNDON == true ) then
            bkgMusicChannel = audio.play(bkgMusic, {loops= -1,channel = 2})
            audio.resume(bkgMusic)
            unmuteButton.isVisible = true
            muteButton.isVisible = false
        else
            audio.pause(bkgMusic)
            unmuteButton.isVisible = false
            muteButton.isVisible = true
        end
        
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
        audio.stop(bkgMusicChannel)
        UpdateStars()

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", Unmute)
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
