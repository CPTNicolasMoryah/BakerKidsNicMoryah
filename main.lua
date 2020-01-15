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
        starsAsString = file:read( "*a" )
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

function checkifpaid()

    -- Get path for file "data.txt" in the documents directory
    path1 = system.pathForFile( "character1File.txt", system.DocumentsDirectory )
     
    -- Open the file from the path
    file1, reason1 = io.open( path1, "r" )
     
    if file1 then
        print ("***File1 exists")
        -- File exists; read its contents into a string
        charactersAsString = file1:read( "*a" )
        print( "Contents of " .. path1 .. "\n" .. charactersAsString )
    
    
        characters = tonumber(charactersAsString)
    
    
        print ("***New characters = " .. characters)
    
         
    else
        print ("***File1 does not exist")
        -- File open failed; output the reason
        print( "File1 open failed: " .. reason1 )
     
        -- Create file since it doesn't exist yet
        file1 = io.open( path1, "w" )
        
        characters = 0
        if file1 then
            print( "Created file1" )
        else
            print( "Create file1 failed!" )
        end
     
        file1:write( characters .. "")
    
     end
      
    io.close( file1 )




        -- Get path for file "data.txt" in the documents directory
    path2 = system.pathForFile( "character2File.txt", system.DocumentsDirectory )
     
    -- Open the file from the path
    file2, reason2 = io.open( path2, "r" )
     
    if file2 then
        print ("***File2 exists")
        -- File exists; read its contents into a string
        character2AsString = file2:read( "*a" )
        print( "Contents of " .. path2 .. "\n" .. character2AsString )
    
    
        character2 = tonumber(character2AsString)
    
    
        print ("***New characters = " .. character2)
    
         
    else
        print ("***File2 does not exist")
        -- File open failed; output the reason
        print( "File2 open failed: " .. reason2 )
     
        -- Create file since it doesn't exist yet
        file2 = io.open( path2, "w" )
        
        character2 = 0
        if file2 then
            print( "Created file2" )
        else
            print( "Create file2 failed!" )
        end
     
        file2:write( character2 .. "")
    
     end
      
    io.close( file2 )


            -- Get path for file "data.txt" in the documents directory
    path3 = system.pathForFile( "character3File.txt", system.DocumentsDirectory )
     
    -- Open the file from the path
    file3, reason3 = io.open( path3, "r" )
     
    if file3 then
        print ("***File3 exists")
        -- File exists; read its contents into a string
        character3AsString = file3:read( "*a" )
        print( "Contents of " .. path3 .. "\n" .. character3AsString )
    
    
        character3 = tonumber(character3AsString)
    
    
        print ("***New characters = " .. character3)
    
         
    else
        print ("***File3 does not exist")
        -- File open failed; output the reason
        print( "File3 open failed: " .. reason3 )
     
        -- Create file since it doesn't exist yet
        file3 = io.open( path3, "w" )
        
        character3 = 0
        if file3 then
            print( "Created file3" )
        else
            print( "Create file3 failed!" )
        end
     
        file3:write( character3 .. "")
    
     end
      
    io.close( file3 )





                -- Get path for file "data.txt" in the documents directory
    path4 = system.pathForFile( "character4File.txt", system.DocumentsDirectory )
     
    -- Open the file from the path
    file4, reason4 = io.open( path4, "r" )
     
    if file4 then
        print ("***File4 exists")
        -- File exists; read its contents into a string
        character4AsString = file4:read( "*a" )
        print( "Contents of " .. path4 .. "\n" .. character4AsString )
    
    
        character4 = tonumber(character4AsString)
    
    
        print ("***New characters = " .. character4)
    
         
    else
        print ("***File4 does not exist")
        -- File open failed; output the reason
        print( "File4 open failed: " .. reason4 )
     
        -- Create file since it doesn't exist yet
        file4 = io.open( path4, "w" )
        
        character4 = 0
        if file4 then
            print( "Created file4" )
        else
            print( "Create file4 failed!" )
        end
     
        file4:write( character4 .. "")
    
     end
      
    io.close( file4 )
    
end

checkifpaid()

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
--composer.gotoScene( "main_menu" )
composer.gotoScene( "main_menu2" )
--composer.gotoScene( "instructions" )
--composer.gotoScene( "credits_screen" )
--composer.gotoScene( "characterselectscreen" )