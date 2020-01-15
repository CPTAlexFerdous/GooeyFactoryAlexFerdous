--Ferdous Sediqi
-- You_Win screen
-- Description: In this scene whe display the You win screen
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------
-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------
-- Use Widget Library
local widget = require( "widget" )

sceneName = "your_cake2"
local scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-------------------------------------------------------------------------------------------------------
-- Local Sounds
------------------------------------------------------------------------------------------------------
--local youWinSound =  audio.loadSound("Sounds/Correct.wav")
--local yowWinSoundChannel
----------------------------------------------------------------------------------------------------
--local variable
-----------------------------------------------------------------------------------------------------
local bkg_image

local transitionOption =({
    effect="zoomOutInRotate",
    time = 500
})
local transitionOption2 =({
    effect="zoomInOutFade",
    time = 500
})
local transitionOption3 =({
    effect="zoomOutInRotate",
    time = 500
})
local transitionOptions4 = ({
     effect = "fromTop",
     time = 1000
})

-----------------------------------------------------------------------------------------------------
-- Local Functions 
-----------------------------------------------------------------------------------------------------

-- function for going to You win 
local function YouWin()
    composer.gotoScene( "you_win2", transitionOption )

end

-- function for going to questions screen

---------------------------------------------------------------------------------------------------
--Global Functions
---------------------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------
    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/Ferdous2/CakeFerdous@2x.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
    sceneGroup:insert( bkg_image )



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

        -- display the win sound
        --yowWinSoundChannel = audio.play(youWinSound)
        timer.performWithDelay(3000, YouWin )

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


    elseif ( phase == "did" ) then

    end 
end
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
end --function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- ADD EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-----------------------------------------------------------------------------------------
return scene