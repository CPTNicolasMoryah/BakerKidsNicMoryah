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
securityGuard1 = false
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
local starstext
local star1
local star2
local star3
local star4
local star5
local getmoretext
local chef
local Cashier
local securityGuard
local waitress
---------------

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function checkifvisible(  )
    if (characters >= 1) or (chef1 == true) then
        lock1.isVisible = false
        startext1.isVisible = false
        star1.isVisible = false
    end
    if (character2 >= 1) or (Cashier1 == true ) then
        lock2.isVisible = false
        startext2.isVisible = false
        star2.isVisible = false
    end
    if (character3 >= 1) or (securityGuard1 == true) then
        lock3.isVisible = false
        startext3.isVisible = false
        star3.isVisible = false
    end
    if (character4 >= 1) or (waitress1 == true) then
        lock4.isVisible = false
        startext4.isVisible = false
        star4.isVisible = false
    end
end

local function displaystars()
    starstext.text = "= "..stars
end

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "fromRight", time = 500})
end

local function hideText(  )
    getmoretext.isVisible = false
end

local function clickchef(touch)
    if (stars >= 3) and (chef1 == false) and (characters == 0) then
        characters = characters + 1
        chef1 = true
        stars = stars - 3

        file, reason = io.open( path, "w" )
        file:write( stars .. "")
        print ("***New stars = " .. stars)
        io.close( file )

        file1, reason1 = io.open( path1, "w" )
        file1:write( characters .. "")
        print ("***New character = " .. characters)
        io.close( file1 )

        displaystars()
        checkifpaid()
        if (level2done == false) then
            composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
        else
            composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
        end
    elseif (chef1 == true) or (characters >= 1) then
        chef1 = true
        if (level2done == false) then
            composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
        else
            composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
        end
    else
        getmoretext.isVisible = true
        timer.performWithDelay(2000, hideText)
    end
end

local function clickcashier(touch)
    if (stars >= 6) and (Cashier1 == false) and (character2 == 0) then
        Cashier1 = true
        character2 = character2 + 1
        stars = stars - 6
        file, reason = io.open( path, "w" )
        file:write( stars.."" )
        print ("***New stars = " .. stars)
        io.close( file )

        file2, reason2 = io.open( path2, "w" )
        file2:write( character2 .. "")
        print ("***New character = " .. character2)
        io.close( file2 )

        checkifpaid()
        displaystars()
        if (level2done == false) then
            composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
        else
             composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
        end
    elseif (Cashier1 == true) or (character2 >= 1) then
        Cashier1 = true
        if (level2done == false) then
            composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
        else
            composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
        end
    else
        getmoretext.isVisible = true
        timer.performWithDelay(2000, hideText)
    end
end

local function clicksecurityguard(touch)
    if (stars >= 9) and (securityGuard1 == false) and (character3 == 0) then
        securityGuard1 = true
        stars = stars - 9
        character3 = character3 + 1

        file, reason = io.open( path, "w" )
        file:write( stars.."" )
        print ("***New stars = " .. stars)
        io.close( file )

        file3, reason3 = io.open(path3, "w")
        file3:write( character3.."" )
        print("***New characters = ".. character3)
        io.close( file3 )

        checkifpaid()
        displaystars()
        if (level2done == false) then
            composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
        else
            composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
        end
    elseif (securityGuard1 == true) or (character3 >= 1) then
        securityGuard1 = true
        if (level2done == false) then
            composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
        else
            composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
        end
    else
        getmoretext.isVisible = true
        timer.performWithDelay(2000, hideText)
    end
end

local function clickwaitress(touch)
    if (stars >= 12) and (waitress1 == false) and (character4 == 0) then
        waitress1 = true
        stars = stars - 12
        character4 = character4 + 1

        file, reason = io.open( path, "w" )
        file:write( stars.."" )
        print ("***New stars = " .. stars)
        io.close( file )

        file4, reason4 = io.open(path4, "w")
        file4:write( character4.."" )
        print("***New characters = ".. character4)
        io.close( file4 )

        checkifpaid()
        displaystars()
        if (level2done == false) then
            composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
        else
            composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
        end
    elseif (waitress1 == true) or (character4 >= 1) then
        waitress1 = true
        if (level2done == false) then
            composer.gotoScene( "level_select1", {effect = "fromRight", time = 500} )
        else
            composer.gotoScene( "level_select2", {effect = "fromRight", time = 500} )
        end
    else
        getmoretext.isVisible = true
        timer.performWithDelay(2000, hideText)
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
    chef.width = 200
    chef.x = 120
    chef.y = 400

    Cashier = display.newRect(0,0,0,0)
    Cashier.height = 350
    Cashier.width = 200
    Cashier.x = 360
    Cashier.y = 400

    securityGuard = display.newRect(0,0,0,0)
    securityGuard.height = 355
    securityGuard.width = 200
    securityGuard.x = 645
    securityGuard.y = 390

    waitress = display.newRect(0,0,0,0)
    waitress.height = 360
    waitress.width = 200
    waitress.x = 920
    waitress.y = 400
    -- Insert the background image and set it to the center of the screen
    bkg = display.newImageRect("Images/character screen.png", display.contentWidth, display.contentHeight)
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight


    lock1 = display.newImageRect("Images/lock.png", 200, 200) 
    lock1.x = 120
    lock1.y = 400

    lock2 = display.newImageRect("Images/lock.png", 200, 200) 
    lock2.x = 360
    lock2.y = 400

    lock3 = display.newImageRect("Images/lock.png", 200, 200) 
    lock3.x = 645
    lock3.y = 390

    lock4 = display.newImageRect("Images/lock.png", 200, 200)
    lock4.x = 920
    lock4.y = 400

    starstext = display.newText("= 0",275,110, nil, 50)
    starstext:setTextColor(0,0,0)

    star5 = display.newImage("Images/star1.png")
    star5.x = 150
    star5.y = 110
    star5.width = 100
    star5.height = 100

    startext1 = display.newText("3", 200, 200, Arial, 35) 
    startext1.x = 100
    startext1.y = 400 

    startext2 = display.newText("6", 200, 200, Arial, 35) 
    startext2.x = 340
    startext2.y = 400  

    startext3 = display.newText("9", 200, 200, Arial, 35) 
    startext3.x = 620
    startext3.y = 390 

    startext4 = display.newText("12", 200, 200, Arial, 35)
    startext4.x = 900
    startext4.y = 400

    star1 = display.newImage("Images/star1.png")
    star1.x = 140
    star1.y = 400
    star1.width = 35
    star1.height = 35

    star2 = display.newImage("Images/star2.png")
    star2.x = 380
    star2.y = 400
    star2.width = 35
    star2.height = 35

    star3 = display.newImage("Images/star3.png")
    star3.x = 660
    star3.y = 390
    star3.width = 35
    star3.height = 35

    star4 = display.newImage("Images/star3.png")
    star4.x = 940
    star4.y = 400
    star4.width = 35
    star4.height = 35

    getmoretext = display.newText("please collect more stars", 200, 200, Arial, 35)
    getmoretext.x = 560
    getmoretext.y = 110
    getmoretext.isVisible = false

    -- Associating display objects with this scene 
    sceneGroup:insert( Cashier )
    sceneGroup:insert( chef )
    sceneGroup:insert( securityGuard )
    sceneGroup:insert( waitress )
    sceneGroup:insert( bkg )
    sceneGroup:insert(lock1)
    sceneGroup:insert( lock2 )
    sceneGroup:insert( lock3 )
    sceneGroup:insert( lock4 )
    sceneGroup:insert( star4 )
    sceneGroup:insert( star3 )
    sceneGroup:insert( star2 )
    sceneGroup:insert( star1 )
    sceneGroup:insert( starstext )
    sceneGroup:insert( star5 )
    sceneGroup:insert( startext1 )
    sceneGroup:insert( startext2 )
    sceneGroup:insert( startext3 )
    sceneGroup:insert( startext4 )
    sceneGroup:insert( getmoretext )



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
        displaystars()
        checkifpaid()
        checkifvisible()


-----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        chef:addEventListener("touch", clickchef)
        Cashier:addEventListener("touch", clickcashier)
        securityGuard:addEventListener("touch", clicksecurityguard)
        waitress:addEventListener("touch", clickwaitress)
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
        UpdateStars()
        checkifpaid()
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