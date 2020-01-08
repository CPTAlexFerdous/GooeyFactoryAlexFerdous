-- Title: level_select.lua
-- Created by: Alex De Meo
-- Date: Dec. 7, 2019
-- Description: This is the instructions screen. From the instructions that our
-- group of grade 3s, this is where you will learn how to play.

-- Use composer library
local composer = require("composer")

-- Use widget Library 
local widget = require( "widget" )

-- Name the Scene Object
sceneName = "level_select"

----------------------------------------------------------------------------
local scene = composer.newScene( sceneName )

-- get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)

------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------
local backButton
local levelSelectText
local level1Button
local level1Text
local level2Button
local level2Text
local level3Button
local level3Text

------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------
-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 500} )
end

-- create transition to level 1
local function Level1Transition( )
    composer.gotoScene("level1_screen", {effect= "fade", time = 500} )
end

--create transition to level 2 
local function Level2Transition(  )
    composer.gotoScene("Level2_screen", {effect= "fade", time = 500} )
end

-- create transition to level 3
local function Level3Transition(  )
    composer.gotoScene("level3_screen", {effect= "fade", time = 500} )
end

local function Level4Transition(  )
    composer.gotoScene("level4_screen", {effect= "fade", time = 500} )
end

-- function is called when the screen doesn't exist
function scene:create( event )
    local sceneGroup = self.view

    display.setDefault("background", 1, 1, 1)


    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*14/16,

        -- Setting Dimensions
        width = 100,
        height = 50,

        -- Setting Visual Properties
        defaultFile = "Images/backButtonUnpressedAlex.png",
        overFile = "Images/BackButtonPressedAlex.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -- create level1 buttons
    level1Button = widget.newButton(
    {
        -- setting the Position
        x = display.contentWidth/3,
        y = display.contentHeight*2/5,

        -- set Dimensions
        width = 150,
        height = 150,
        -- setting Visual Properties
        defaultFile = "Images/Level1ScreenAlex.png",
        overFile = "Images/level1ButtonPressed.png",

        -- set functional Properties
        onRelease = Level1Transition
    } )

    -- Create level 2 button 
    level2Button = widget.newButton(
    {
        -- setting the Position
        x = display.contentWidth*2/3,
        y = display.contentHeight*2/5,

        -- set Dimensions
        width = 150,
        height = 150,
        -- setting Visual Properties
        defaultFile = "Images/Ferdous2/level2_screenFerdous.png",
        overFile = "Images/Level2ButtonPressed.png",

        -- set functional Properties
        onRelease = Level2Transition

    } )

    -- create level 3 buttons
    level3Button = widget.newButton(
    {
        -- setting its position 
        x = display.contentWidth/3,
        y = display.contentHeight*7/10,

        -- set dimensions 
        width = 150, 
        height = 150,

        -- setting the visual properties 
        defaultFile = "Images/Level3ScreenAlex.png",
        overFile = "Images/Level3ButtonAlex.png",

        -- set functional properties
        onRelease = Level3Transition
    } )

    level4Button = widget.newButton(
    {
        -- setting its position 
        x = display.contentWidth*2/3,
        y = display.contentHeight*7/10,

        -- set dimensions 
        width = 150, 
        height = 150,

        -- setting the visual properties 
        defaultFile = "Images/Ferdous4/level4ScreenFerdous.png",
        overFile = "Images/level4Button.png",

        -- set functional properties
        onRelease = Level4Transition
    } )

    -- create levelSelectText
    levelSelectText = display.newText("LEVELS", display.contentWidth/2, display.contentHeight/5, nil, 100)
    levelSelectText:setTextColor(0, 0, 0)

    -- create level Texts
    level1Text = display.newText("Level 1", display.contentWidth/3 + 3, display.contentHeight*7/13, nil, 50)
    level1Text:setTextColor(0, 0, 0)

    level2Text = display.newText("Level 2", display.contentWidth*2/3, display.contentHeight*7/13, nil, 48)
    level2Text:setTextColor(0, 0, 0)

    level3Text = display.newText("Level 3", display.contentWidth/3, display.contentHeight*11/13, nil, 49)
    level3Text:setTextColor(0, 0, 0)

    level4Text = display.newText("Level 4", display.contentWidth*2/3, display.contentHeight*11/13, nil, 49)
    level4Text:setTextColor(0, 0, 0)

    -- add buttons, objects and images to sceneGroup
    sceneGroup:insert( backButton )
    sceneGroup:insert( levelSelectText )
    sceneGroup:insert( level1Button )
    sceneGroup:insert( level1Text )
    sceneGroup:insert( level2Button ) 
    sceneGroup:insert( level2Text )
    sceneGroup:insert( level3Button )
    sceneGroup:insert( level3Text )
    sceneGroup:insert( level4Button )
    sceneGroup:insert( level4Text )
end

-- the function is called when the scene is still off screen (but is about to come on screen)
function scene:show(event)
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        
    end

end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    ----------------------------------------------------

    if (phase == "will") then

    --------------------------------------------------
    elseif (phase == "did") then
        -- stop the sound 
    end
end

function scene:destroy( event )
    local sceneGroup = self.view
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
