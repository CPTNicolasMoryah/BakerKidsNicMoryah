-- Creating Scene Object
-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Moryah
-- Date: nov. 21, 2019
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
lives = 3

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------
-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------
-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------
-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
-- The local variables for this scene
local bkg_image
local heart
local heart2
local heart3
local backButton
local countDownTimer
local clockText
local points = 0
local pointsText

local questionObject

local textField

local chefimage

local userAnswer
local correctAnswer

local level2Sound = audio.loadSound("Sounds/level2screenmusic.mp3")

local level2SoundChannel 

local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

local incorrectSound = audio.loadSound("Sounds/incorrect.mp3")
local incorrectSoundChannel

local loseSound = audio.loadSound("Sounds/lose.mp3")
local loseSoundChannel
-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
TOTALSECONDS = 60
secondsLeft = 60

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function Mute(touch)
    if (touch.phase == "ended") then
        -- pause the Sound
        audio.pause(level2SoundChannel)
        -- set the boolean variable to be false (sound is now muted)
        SOUNDON = true
        -- hide the mute button
        muteButton.isVisible = false
        -- make the unmute button visible
        unmuteButton.isVisible = true
    end
end

local function Unmute(touch)
    if (touch.phase == "ended") then
        -- pause the Sound
        audio.pause(level2SoundChannel)
        -- set the boolean variable to be false (sound is now muted)
        SOUNDON = false
        -- hide the mute button
        muteButton.isVisible = true
        -- make the unmute button visible
        unmuteButton.isVisible = false
    end
end

-- The function that will go to the main menu 
local function YouLose1()
    composer.gotoScene( "YouLose1", {effect = "crossFade", time = 500})
end

-- The function that will go to the main menu 
local function YouWin1()
    timer.cancel(countDownTimer)
    composer.gotoScene( "YouWin1", {effect = "crossFade", time = 500})
end

-- function that calls the timer
local function UpdateTime()
    -- decrement the number of seconds
    secondsLeft = secondsLeft - 1
    timer.performWithDelay(1000)

    -- display the number of seconds seconds left in the clock object
    clockText.text = secondsLeft .. ""

    if (secondsLeft == 0 ) then

        -- everytime user gets answer wrong take away 1 life
        lives = 0

        -- reset the number of seconds left
        secondsLeft = TOTALSECONDS
        timer.performWithDelay(1000, Visible)
        timer.cancel(countDownTimer)
        loseSoundChannel = audio.play(loseSound)
        composer.gotoScene( "YouLose1", {effect = "crossFade", time = 500})
    end
end

-- function that calls the timer
local function StartTimer(event)

    -- create a countdown timer that loops infinitely
    countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
    countDownTimer.isVisible = true

    -- coordinates
    countDownTimer.x = 1000
    countDownTimer.y = 50
end

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "crossFade", time = 500})
end

local function Visible()

    countDownTimer.isVisible = true
    pointsText.isVisible = true
    correctObject.isVisible = false
    incorrectObject.isVisible = false
end

local function hideWords()

    questionObject.isVisible = false
end

local function HideCorrectIncorrect ()

    correctObject.isVisible = false
    incorrectObject.isVisible =  false
end

local function AskQuestion()

    HideCorrectIncorrect()

    local word = math.random(1,15)

    if (word == 1) then
        questionObject.text = "ICIN_"
        --questionObject.isVisible = true

        correctAnswer = "G"

    elseif (word == 2) then
        questionObject.text = "BUTTE_"
        --questionObject.isVisible = true

        correctAnswer = "R"

    elseif (word == 3) then
        questionObject.text = "SPRINKL_"

        correctAnswer = "E"

    elseif (word == 4) then
        questionObject.text = "SUGA_"

        correctAnswer = "R"

    elseif (word == 5) then
        questionObject.text = "VANILL_"

        correctAnswer = "A"

    elseif (word == 6) then
        questionObject.text = "MARSHMALLO_"

        correctAnswer = "W"

    elseif (word == 7) then
        questionObject.text = "CHOCOLAT_"

        correctAnswer = "E"

    elseif (word == 8) then
        questionObject.text = "FLOU_"

        correctAnswer = "R"

    elseif (word == 9) then
        questionObject.text = "BAKING POWDE_"

        correctAnswer = "R"

    elseif (word == 10) then
        questionObject.text = "BAKING SOD_"

        correctAnswer = "A"

    elseif (word == 11) then
        questionObject.text = "FOOD COLOURIN_"

        correctAnswer = "G"

    elseif (word == 12) then
        questionObject.text = "E_G"

        correctAnswer = "G"

    elseif (word == 13) then
        questionObject.text = "MI_K"

        correctAnswer = "L"

    elseif (word == 14) then
        questionObject.text = "SA_T"

        correctAnswer = "L"

    elseif (word == 15) then
        questionObject.text = "BAKING OI_"

        correctAnswer = "L"

    end

end

local function textFieldListener( event )

    if (event.phase == "began") then


    elseif (event.phase == "submitted") then
        userAnswer = event.target.text
        print ("***correctAnswer = " .. correctAnswer)
        print ("***userAnswer = " .. userAnswer)

        -- if user enters the correct letter
        if (string.upper(userAnswer) == correctAnswer) then

            -- plays correct sound
            correctSoundChannel = audio.play(correctSound)

            -- show correct object
            correctObject.isVisible = true

            -- adds a point
            points = points + 1

            -- update the points in the display object
            pointsText.text = "points = " .. points

            -- add timer
            --timer.performWithDelay(1000, hideWords)
            --timer.performWithDelay(1000, HideCorrectIncorrect)
            --AskQuestion()

            -- you win! after 5 points       
            if (points == 5) then
                
                YouWin1()

            else
                timer.performWithDelay(1000, AskQuestion)
            end
        else -- if user ans is wrong

            -- play sound for the wrong answer
            incorrectSoundChannel = audio.play(incorrectSound, {channel=5})

            -- show incorrect
            incorrectObject.isVisible = true

            -- create incorrect text object
            incorrectObject.text = "Incorrect! The correct answer was " .. correctAnswer

            -- everytime user gets answer wrong take away 1 life
            lives = lives - 1

            -- taking away hearts
            if (lives == 2) then

                -- heart isn't visible
                heart.isVisible = false
                timer.performWithDelay(1000, AskQuestion)

            elseif (lives == 1) then 

                -- hearts aren't visible
                heart.isVisible = false
                heart2.isVisible = false
                timer.performWithDelay(1000, AskQuestion)

            elseif (lives == 0) then 

                -- hearts aren't visible
                heart.isVisible = false
                heart2.isVisible = false
                heart3.isVisible = false

                timer.cancel(countDownTimer)

                loseSoundChannel = audio.play(loseSound)
            YouLose1()

            end
        end
        event.target.text = ""
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS                                                                
-----------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImage("Images/Level1ScreenMoryah.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    heart = display.newImage("Images/heart.png", 810, 35)
    heart.width = 66
    heart.height = 66

    heart2 = display.newImage("Images/heart.png", 880, 35)
    heart2.width = 66
    heart2.height = 66

    heart3 = display.newImage("Images/heart.png", 950, 35)
    heart3.width = 66
    heart3.height = 66

    questionObject = display.newText( "", 512, 148, nil, 99 )
    questionObject:setTextColor(1, 0, 0)
    questionObject.isVisible = true


    -------------------------------------------------------------------------------------
    -- OBJECT CREATION
    -------------------------------------------------------------------------------------
    -- display the amount of words as a text object
    pointsText = display.newText("points = " .. points, 512, 38, nil, 55)
    pointsText:setTextColor(0, 0, 0)

    clockText = display.newText("" .. secondsLeft, 77, 40, nil, 66)
    clockText:setTextColor(1, 0, 0)

    -- create the correct text object object and make it invisible
    correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*3.1/7, nil, 40 )
    correctObject:setTextColor(1, 0, 0)
    correctObject.isVisible = false

    -- create the incorrect text object object and make it invisible
    incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*3.1/7, nil, 40 )
    incorrectObject:setTextColor(1, 0, 0)
    incorrectObject.isVisible = false


    textField = native.newTextField( display.contentWidth/2, 280, 150, 80)
    textField.inputType = "default"

    chefimage = display.newImageRect("Images/chef.png", 200, 200)
    chefimage.height = 350
    chefimage.width = 100
    chefimage.x = 50
    chefimage.y = 550
    if (chef1 == true) then
        chefimage.isVisible = true
    else
        chefimage.isVisible = false
    end

    Cashier = display.newImageRect( "Images/cashier.png", 0,0 )
    Cashier.height = 350
    Cashier.width = 100
    Cashier.x = 50
    Cashier.y = 550
    if (Cashier1 == true) then
        Cashier.isVisible = true
    else
        Cashier.isVisible = false
    end

    securityGuard = display.newImageRect( "Images/security guard.png", 0,0 )
    securityGuard.height = 350
    securityGuard.width = 100
    securityGuard.x = 50
    securityGuard.y = 550
    if (securityGuard1 == true) then
        securityGuard.isVisible = true
    else
        securityGuard.isVisible = false
    end

    waitress = display.newImageRect( "Images/waitress.png", 0,0 )
    waitress.height = 350
    waitress.width = 100
    waitress.x = 50
    waitress.y = 550
    if (waitress1 == true) then
        waitress.isVisible = true
    else
        waitress.isVisible = false
    end

    cashoverlay = display.newImageRect( "Images/Level1ScreenMoryah1.png",0,0)
    cashoverlay.anchorX = 0
    cashoverlay.anchorY = 1536
    cashoverlay.x = 1
    cashoverlay.y = 840
    cashoverlay.height = 398
    cashoverlay.width = 320
    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*9/10,

        -- Setting Dimensions

        width = 150,
        height = 70,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonUnpressedMoryah.png",
        overFile = "Images/BackButtonPressedMoryah.png",

        -- Setting Functional Properties
        onRelease = BackTransition
     } )

-----------------------------------------------------------------------------------------
-- Insert images into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( backButton )
    sceneGroup:insert( heart )
    sceneGroup:insert( heart2 )
    sceneGroup:insert( heart3 )
    sceneGroup:insert( pointsText )
    sceneGroup:insert( textField)
    sceneGroup:insert( clockText )
    sceneGroup:insert( correctObject )
    sceneGroup:insert( incorrectObject )
    sceneGroup:insert( questionObject )
    sceneGroup:insert( chefimage )
    sceneGroup:insert( Cashier )
    sceneGroup:insert( securityGuard )
    sceneGroup:insert( waitress )
    sceneGroup:insert( cashoverlay )

end --function scene:create( event )

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        ---------------------------------------------------------------------------------
        -- FUNTION CALLS
        ---------------------------------------------------------------------------------
        --call the functions
        level2SoundChannel = audio.play(level2Sound,{loops = -1})
        textField.isVisible = true
        textField:addEventListener( "userInput", textFieldListener)
        points = 0
        lives = 3
        StartTimer()
        Visible()
        AskQuestion()


    end

end --function scene:show( event )
-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -------------------------------------------------------------------------------------
        textField:removeEventListener( "userInput", textFieldListener)
        textField.isVisible = false
        audio.stop(level2SoundChannel)
        UpdateStars()

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

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