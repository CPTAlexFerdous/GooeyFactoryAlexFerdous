--Title: Level2_screen
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make the level 2 screen.
-----------------------------------------------------------------------------------------
-- Use Composer Library
local composer = require( "composer" )
local widget = require( "widget" )

-- Name the Scene
sceneName = "Level2_screen"
--scene = composer.newScene(sceneName)
--local physics = require( "physics")

-----------------------------------------------------------------------------------------
-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------------------
--local sounds
--------------------------------------------------------------------------------------------------------
local backgroundSound = audio.loadStream("Sounds/jazzy.mp3")
local backgroundSoundChannel

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------- 
-- text for finishing cooking
local readyText


--variables for the touch of the objects
local touchChocolate = false
local touchButter = false
local touchFlour = false
local touchEggs = false
local touchSugar = false
local wrongFlourTouch = 0

--variables for the questions
local answerTextObject 
local wrongAnswer1TextObject
local wrongAnswer2TextObject
local wrongAnswer3TextObject
local wrongAnswer4TextObject

local answer 
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3
local wrongAnswer4
local scrollSpeed = 2

local sugar_image
local egg_image
local chocolate_image
local flour_image
local butter_image

local butter_image
local smallChocolate
local smallSugar
local smallFlour
local smallButter
local smallEggs
local checkMarks
local checkMark
local checkMark2
local checkMark3
local checkMark4
local checkMark5
local readyImage
local yesButton
local backToMainMenu

--------------------------------------------------------------------------------------
--set variables for making scene transition
------------------------------------------------------------------------------------------
local transitionOption =({
    effect="crossFade",
    time = 500
})

local transitionOption2 =({
    effect="flipFadeOutIn",
    time = 500
})
--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------


-- The function that will go to the main menu 

local function BackTransition()
    composer.gotoScene( "level_select", transitionOption2 )
end

local function gotoQuestions( ... )
    composer.gotoScene("level2_questions", transitionOption)
  
end

local function ResetIngredients()
    -- reset the original sugar image
    sugar_image.x = 960
    sugar_image.y = 500
    sugar_image.isVisible = true
    smallSugar.isVisible = false
    checkMark4.isVisible = false
    flour_image.x = 960
    flour_image.y = 225
    flour_image.isVisible = true
    smallFlour.isVisible = false
    checkMark3.isVisible = false
    egg_image.x = 960
    egg_image.y = 410
    egg_image.isVisible = true
    smallEggs.isVisible = false
    checkMark5.isVisible = false
    butter_image.x = 960
    butter_image.y = 310
    butter_image.isVisible = true
    smallButter.isVisible = false
    checkMark.isVisible = false
    chocolate_image.x = 960
    chocolate_image.y = 130
    chocolate_image.isVisible = true
    smallChocolate.isVisible = false
    checkMark2.isVisible =  false    
end

local function movingChocolate(touch)

    if (touchButter == false) and (touchEggs == false) and 
        (touchFlour == false) and (touchSugar == false) then

        if (touch.phase == "began") then
            --boolean for click the gredian
            touchChocolate = true
            instructionText.isVisible = false
            --touchSoundChannel = audio.play(touchSound)

        --drag the objects to follow the mouse
        elseif (touch.phase == "moved") then
            chocolate_image.x = touch.x
            chocolate_image.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            touchChocolate = false

            if (((bowl_image.x - bowl_image.width/1) < chocolate_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > chocolate_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < chocolate_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > chocolate_image.y ) ) then

                -- setting the position of the chocolate to be in the center of the box
                chocolate_image.x = bowl_image.x
                chocolate_image.y = bowl_image.y
                --foodSoundChannel = audio.play(foodSound)

                chocolate_image.isVisible = false                
                checkMark2.isVisible = true
                smallChocolate.isVisible = true
              
            end

            chocolate_image.x = 960
            chocolate_image.y = 130
        end

        if(checkMark.isVisible == true)and (checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and (checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButton.isVisible = true
            backToMainMenu.x = 407
            backToMainMenu.y = 600

        end
    end
end



local function movingFlour(touch)
    --only work if none of the other objects have been touched
    if (touchSugar == false) and (touchChocolate == false) and 
        (touchButter == false) and (touchEggs == false) then 

        if (touch.phase == "began") then
            instructionText.isVisible = false

            --let other boxes know it has been clicked
            touchFlour = true       
            --touchSoundChannel = audio.play(touchSound)

        elseif (touch.phase == "moved") then
        --dragging function
            flour_image.x = touch.x
            flour_image.y = touch.y
        elseif (touch.phase == "ended") then
            touchFlour = false
            if (((bowl_image.x - bowl_image.width/1) < flour_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > flour_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < flour_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > flour_image.y ) ) then
            -- setting the position of the number to be in the center of the box
                flour_image.x = bowl_image.x
                flour_image.y = bowl_image.y
                --foodSoundChannel = audio.play(foodSound)

                flour_image.isVisible = false
                checkMark3.isVisible = true
                smallFlour.isVisible = true

            end
            flour_image.x = 960
            flour_image.y = 225
       
        end

        if(checkMark.isVisible == true)and(checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and(checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButton.isVisible = true
            backToMainMenu.x = 407
            backToMainMenu.y = 600


        end
    end
end
local function movingButter(touch)
    --only work if none of the other objects have been touched
    if (touchFlour == false) and (touchChocolate == false) and 
        (touchSugar == false) and (touchEggs == false) then

        if (touch.phase == "began") then
            instructionText.isVisible = false

            -- boolean to  know it has been clicked
            touchButter = true  
            --touchSoundChannel = audio.play(touchSound)
        elseif (touch.phase == "moved") then
            --dragging function
            butter_image.x = touch.x
            butter_image.y = touch.y
        elseif (touch.phase == "ended") then
            touchButter = false
            if (((bowl_image.x - bowl_image.width/1) < butter_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > butter_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < butter_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > butter_image.y ) ) then
            -- setting the position of butter
                butter_image.x = bowl_image.x
                butter_image.y = bowl_image.y
                --foodSoundChannel = audio.play(foodSound)
                butter_image.isVisible = false
                checkMark.isVisible = true
                smallButter.isVisible = true

        end
                 butter_image.x = 960
                 butter_image.y = 310
     end

        if(checkMark.isVisible == true) and (checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and (checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButton.isVisible = true
            backToMainMenu.x = 407
            backToMainMenu.y = 600
    

        end
    end
end


local function movingEggs(touch)
    --only work if none of the other objects have been touched
    if (touchFlour == false) and (touchChocolate == false) and
        (touchButter == false) and (touchSugar == false) then  

        if (touch.phase == "began") then
            instructionText.isVisible = false

            --boolean know it has been clicked
            touchEggs = true 
             --touchSoundChannel = audio.play(touchSound)

        elseif (touch.phase == "moved") then
        --dragging function
            egg_image.x = touch.x
            egg_image.y = touch.y
        elseif (touch.phase == "ended") then
            touchEggs = false
            if (((bowl_image.x - bowl_image.width/1) < egg_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > egg_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < egg_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > egg_image.y ) ) then
            -- setting the position of the objects to be in the center of the box
                egg_image.x = bowl_image.x
                egg_image.y = bowl_image.y
                --foodSoundChannel = audio.play(foodSound)
                egg_image.isVisible = false
                checkMark5.isVisible = true
                smallEggs.isVisible = true

        end
            egg_image.x = 960
            egg_image.y = 410
         
        end

        if(checkMark.isVisible == true) and (checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and (checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButton.isVisible = true   
            backToMainMenu.x = 407
            backToMainMenu.y = 600


        end
    end
end

local function movingSugar(touch)
    --only work if none of the other objects have been touched
    if (touchFlour == false) and (touchChocolate == false) and 
        (touchButter == false) and (touchEggs == false) then    

        if (touch.phase == "began") then
            instructionText.isVisible = false

            --boolean to know it has been clicked
            touchSugar = true  

            --touchSoundChannel = audio.play(touchSound)

        elseif (touch.phase == "moved") then
            --dragging function
            sugar_image.x = touch.x
            sugar_image.y = touch.y
        elseif (touch.phase == "ended") then
            touchSugar = false
            if (((bowl_image.x - bowl_image.width/1) < sugar_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > sugar_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < sugar_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > sugar_image.y ) ) then
            -- setting the position of the sugar to be in the center of the box
                sugar_image.x = bowl_image.x
                sugar_image.y = bowl_image.y
                --foodSoundChannel = audio.play(foodSound)

                sugar_image.isVisible = false
                checkMark4.isVisible = true
                smallSugar.isVisible = true
                smallChocolate.isVisible = false
                smallEggs.isVisible = false
            end
            sugar_image.x = 960
            sugar_image.y = 500
        end
    end
        if(checkMark.isVisible == true) and (checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and (checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButton.isVisible = true
            backToMainMenu.x = 407
            backToMainMenu.y = 600
 
        end
end



local function AddAnswerBoxEventListeners()
    chocolate_image:addEventListener("touch", movingChocolate)
    butter_image:addEventListener("touch", movingButter)
    egg_image:addEventListener("touch", movingEggs)
    flour_image:addEventListener("touch", movingFlour)
    sugar_image:addEventListener("touch", movingSugar)
end 


-- Function that Removes Listeners to each objects
local function RemoveAnswerBoxEventListeners()
    chocolate_image:removeEventListener("touch", movingChocolate)
    egg_image:removeEventListener("touch", movingButter)
    egg_image:removeEventListener("touch", movingEggs)
    flour_image:removeEventListener("touch", movingFlour)
    sugar_image:removeEventListener("touch", movingSugar)
end 




-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    questionText = display.newText( "" , 0, 0, nil, 100)
    questionText.x = display.contentWidth * 0.7
    questionText.y = display.contentHeight * 0.6
    questionText:setTextColor(0.2, 0.4, 1)

   
    -- set the background to be black
    bkg_image = display.newImageRect("Images/Ferdous2/level2_screenFerdous.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -- display text for asking if the user ready for questions
    readyImage = display.newImageRect("Images/Ferdous2/text1.png", display.contentWidth, display.contentHeight)
    readyImage.x = 960
    readyImage.y = 610
    readyImage.width = 900
    readyImage.height = 700
    -- Associating display objects with this scene 
    sceneGroup:insert( readyImage )
    readyImage.isVisible = false
-----------------------------------------------------------------------------------------
-- BUTTON WIDGETS
-----------------------------------------------------------------------------------------

    
-----------------------------------------------------------------------------------------
    -- Associating Buttons with this scene
    
    -- Creating bowl image
    bowl_image =display.newImageRect("Images/Ferdous2/bowlPlaceholder.png", display.contentWidth, display.contentHeight) 
    bowl_image.x = 400
    bowl_image.y = 400
    bowl_image.width = 150
    bowl_image.height = 150
    sceneGroup:insert(bowl_image)

    -- Creating Back Button
    backToMainMenu = widget.newButton( 
    {
    -- Setting Position
    x = display.contentWidth*1/8,
    y = display.contentHeight*15/16,
    -- Setting Dimensions
    width = 100,
    height = 106,
    -- Setting Visual Properties
     defaultFile = "Images/Ferdous4/backButtonUnpressedAlex.png",
    overFile = "Images/Ferdous4/BackButtonPressedAlex@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
})
    sceneGroup:insert( backToMainMenu )

 
    --Creating yes buttton
    yesButton = widget.newButton( 
    {
    -- Setting Position
    x = display.contentWidth*1/2.5,
    y = display.contentHeight*15/25,
    -- Setting Dimensions
    width = 100,
    height = 106,
    -- Setting Visual Properties
    defaultFile = "Images/Ferdous2/YesButtonPressedFerdous@2x.png",
    overFile = "Images/Ferdous2/YesButtonUnPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = gotoQuestions
})
    yesButton.isVisible = false
    sceneGroup:insert(yesButton)
     -- Creating butter image 
    butter_image = display.newImageRect("Images/Ferdous2/butter.png", display.contentWidth, display.contentHeight)
    butter_image.x = 960
    butter_image.y = 310
    butter_image.width = 100
    butter_image.height = 100
    sceneGroup:insert( butter_image )
   --Creating chocolate image 
    chocolate_image = display.newImageRect("Images/Ferdous2/Chocolate.png", display.contentWidth, display.contentHeight)
    chocolate_image.x = 960
    chocolate_image.y = 130
    chocolate_image.width = 90
    chocolate_image.height = 50
    sceneGroup:insert(chocolate_image)
    
-- Creating flour image 
    flour_image = display.newImageRect("Images/Ferdous2/flour.png", display.contentWidth, display.contentHeight)
    flour_image.x = 960
    flour_image.y = 225
    flour_image.width = 100
    flour_image.height = 100
    sceneGroup:insert(flour_image)


    
    -- Creating egg image 
    egg_image = display.newImageRect("Images/Ferdous2/eggs.png", display.contentWidth, display.contentHeight)
    egg_image.x = 960
    egg_image.y = 410
    egg_image.width = 100
    egg_image.height = 100
    sceneGroup:insert(egg_image)


    -- Creating sugar image 
    sugar_image = display.newImageRect("Images/Ferdous2/sugar.png", display.contentWidth, display.contentHeight)
    sugar_image.x = 960
    sugar_image.y = 500
    sugar_image.width = 100
    sugar_image.height = 100
    sceneGroup:insert(sugar_image)


    
    butter_imageShort = display.newImageRect("Images/Ferdous2/butter.png", display.contentWidth, display.contentHeight)
    butter_imageShort.x = 45
    butter_imageShort.y = 370
    butter_imageShort.width =60
    butter_imageShort.height = 60
    sceneGroup:insert(butter_imageShort)

    --Creating checkMarks 
    checkMark = display.newImageRect("Images/Ferdous2/Mark.png", display.contentWidth, display.contentHeight)
    checkMark.x = 45
    checkMark.y = 370
    checkMark.width =60
    checkMark.height = 60
    sceneGroup:insert(checkMark)
    checkMark.isVisible = false
    -- Creating small Images
    chocolate_imageShort = display.newImageRect("Images/Ferdous2/Chocolate.png", display.contentWidth, display.contentHeight)
    chocolate_imageShort.x = 45
    chocolate_imageShort.y = 200
    chocolate_imageShort.width = 60
    chocolate_imageShort.height = 60
    sceneGroup:insert(chocolate_imageShort)

    --Creating checkMarks 
    checkMark2 = display.newImageRect("Images/Ferdous2/Mark.png", display.contentWidth, display.contentHeight)
    checkMark2.x = 45
    checkMark2.y = 200
    checkMark2.width = 60
    checkMark2.height = 60
    sceneGroup:insert(checkMark2)
    checkMark2.isVisible = false

    -- Creating small Images of objects
    flour_imageShort = display.newImageRect("Images/Ferdous2/flour.png", display.contentWidth, display.contentHeight)
    flour_imageShort.x = 45
    flour_imageShort.y = 280
    flour_imageShort.width = 60
    flour_imageShort.height = 60
    sceneGroup:insert(flour_imageShort)

    --Creating checkMarks 
    checkMark3 = display.newImageRect("Images/Ferdous2/Mark.png", display.contentWidth, display.contentHeight)
    checkMark3.x = 45
    checkMark3.y = 280
    checkMark3.width = 60
    checkMark3.height = 60
    sceneGroup:insert(checkMark3)
    checkMark3.isVisible = false

    -- Creating small Images of objects
    sugar_imageShort = display.newImageRect("Images/Ferdous2/sugar.png", display.contentWidth, display.contentHeight)
    sugar_imageShort.x = 45
    sugar_imageShort.y = 540
    sugar_imageShort.width = 60
    sugar_imageShort.height = 60
    sceneGroup:insert(sugar_imageShort)

    --Creating checkMarks 
    checkMark4 = display.newImageRect("Images/Ferdous2/Mark.png", display.contentWidth, display.contentHeight)
    checkMark4.x = 45
    checkMark4.y = 540
    checkMark4.width = 60
    checkMark4.height = 60
    sceneGroup:insert(checkMark4)
    checkMark4.isVisible = false

   -- Creating small Images of objects
    egg_imageShort = display.newImageRect("Images/Ferdous2/eggs.png", display.contentWidth, display.contentHeight)
    egg_imageShort.x = 45
    egg_imageShort.y = 460
    egg_imageShort.width = 60
    egg_imageShort.height = 60
    sceneGroup:insert(egg_imageShort)

    --Creating checkMarks 
    checkMark5 = display.newImageRect("Images/Ferdous2/Mark.png", display.contentWidth, display.contentHeight)
    checkMark5.x = 45
    checkMark5.y = 460
    checkMark5.width = 60
    checkMark5.height = 60
    sceneGroup:insert(checkMark5)
    checkMark5.isVisible = false  

   -- Creating small Images of objects to stay in the bowl
    smallChocolate = display.newImageRect("Images/Ferdous2/Chocolate.png", display.contentWidth, display.contentHeight)
    smallChocolate.x = 400
    smallChocolate.y = 390
    smallChocolate.width = 50
    smallChocolate.height = 20
    sceneGroup:insert(smallChocolate)    
    smallChocolate.isVisible = false

   -- Creating small Images of objects to stay in the bowl
    smallButter = display.newImageRect("Images/Ferdous2/butter.png", display.contentWidth, display.contentHeight)
    smallButter.x = 400
    smallButter.y = 390
    smallButter.width = 50
    smallButter.height = 20
    sceneGroup:insert(smallButter)    
    smallButter.isVisible = false

   -- Creating small Images of objects to stay in the bowl
    smallFlour = display.newImageRect("Images/Ferdous2/flour.png", display.contentWidth, display.contentHeight)
    smallFlour.x = 400
    smallFlour.y = 390
    smallFlour.width = 50
    smallFlour.height = 20
    sceneGroup:insert(smallFlour)    
    smallFlour.isVisible = false

   -- Creating small Images of objects to stay in the bowl
    smallSugar = display.newImageRect("Images/Ferdous2/sugar.png", display.contentWidth, display.contentHeight)
    smallSugar.x = 400
    smallSugar.y = 390
    smallSugar.width = 50
    smallSugar.height = 20
    sceneGroup:insert(smallSugar)    
    smallSugar.isVisible = false

   -- Creating small Images of objects to stay in the bowl
    smallEggs = display.newImageRect("Images/Ferdous2/eggs.png", display.contentWidth, display.contentHeight)
    smallEggs.x = 400
    smallEggs.y = 390
    smallEggs.width = 50
    smallEggs.height = 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    sceneGroup:insert(smallEggs)    
    smallEggs.isVisible = false

 

    instructionText = display.newImageRect("Images/Ferdous2/cook2.png", display.contentWidth, display.contentHeight)
    instructionText.x = 500
    instructionText.y = 200
    instructionText.width = 700
    instructionText.height = 500
    instructionText.isVisible = true
    sceneGroup:insert(instructionText)

end 

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
-----------------------------------------------------------------------------------------
    local phase = event.phase
-----------------------------------------------------------------------------------------
-- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
        instructionText.isVisible = true
-----------------------------------------------------------------------------------------
   elseif ( phase == "did" ) then
        instructionText.isVisible = true

        AddAnswerBoxEventListeners()
        ResetIngredients()


        if (soundOn == true) then
            backgroundSoundChannel = audio.play(backgroundSound, {channel=12, loops= -1})
            audio.setVolume(0.25, {channel=12})
        else
            backgroundSoundChannel = audio.play(backgroundSound, {channel=12, loops= -1})
            audio.pause(backgroundSoundChannel)
            audio.setVolume(0.25, {channel=12})
        end
        yesButton.isVisible = false
          
    end
end 
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
----------------------------------------------------------------------------------------
    if ( phase == "will" ) then  
        --ResetIngredients()

-----------------------------------------------------------------------------------------
-- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        RemoveAnswerBoxEventListeners()
        

        audio.stop(backgroundSoundChannel)

        --remove EventListener

       
        --audio.pause(backgroundSoundChannel)
        readyImage.isVisible = false
        yesButton.isVisible = false
        backToMainMenu.x = 150
        backToMainMenu.y = 715

    end
end
 --function scene:hide( event )

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
-- Creating a group that associates objects with the scene
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