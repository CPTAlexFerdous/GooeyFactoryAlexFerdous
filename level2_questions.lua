--name:Ferdous
--title:level2_questions screen
--Discription: in this scene we display the questions 
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
--local physics = require( "physics")
-- Naming Scene
sceneName = "level2_questions"

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
--Local Sounds
----------------------------------------------------------------------------------------
local music = audio.loadStream("Sounds/inspire.mp3")
local musicChannel

local dingSound = audio.loadSound("Sounds/dingSound.mp3")

local buzzSound = audio.loadSound("Sounds/Wrong Buzzer.mp3")


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
-- variable for question text
local questionText

--variables for answers
local answer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3
local userAnswer
local giveThenAnswer
-- variables for answers texts
local answerText 
local wrongText1
local wrongText2
local wrongText3
-- answers position variable
--local randomQuestion 
--local answerPosition = 1

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7
-- background variables 
local bkg
local cover

-- boolean for touching the answers
--local textTouched = false
-- variables for counting the right answers
local totalAnswer = 0

-- The local variables for the timer
local totalSeconds = 60
local secondsLeft =  60
local clockText
local countDownTimer

local rootImage
--variables for live
local numBerWrong = 0
-- background color

--display.setDefault("background", 0.9, 0.9, 0.5)

------------------------------------------------------------------------------------------
--tasnsition variables
------------------------------------------------------------------------------------------
local transitionOption =({
    effect="slideUp",
    time = 500
})

local transitionOption2 =({
    effect="flip",
    time = 500
})
-- transition effect variable
local transitionOption3 =({
    effect="slideDown",
    time = 500
})
local transitionOption4 =({
    effect="zoomInOutFade",
    time = 500
})
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- function for going back to main menu screen

local function BackTransition()
    composer.gotoScene( "main_menu", transitionOption )
end
-- function for going to level 2 screen 

local function gotoLevel2Screen()
    composer.gotoScene( "Level2_screen", transitionOption2 )
end

-- function for going to you win screen
local function yourcake()
    composer.gotoScene("your_cake2", transitionOption3)

end
-- FUNCTIONS for going to you lose screen
local function youLostScreen(  )
    composer.gotoScene("you_lose2", transitionOption4)

end
-- FUNCTIONS changing the answers positions 
local function PositionAnswers()
    --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    if (answerPosition == 1) then

        answerText.x = X1
        answerText.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText.x = X2
        answerText.y = Y2
        
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y1
            
        wrongText3.x = X1
        wrongText3.y = Y2


    elseif (answerPosition == 3) then

        answerText.x = X1
        answerText.y = Y2
            
        wrongText1.x = X2
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y1
            
    elseif (answerPosition == 4) then

        answerText.x = X2
        answerText.y = Y1
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X2
        wrongText2.y = Y2

        wrongText3.x = X1
        wrongText3.y = Y1
            
    end
end
-- FUNCTION for Displaying Questions

local function DisplayQuestion()
    local randomQuestion = math.random (1, 15)
    if (randomQuestion == 1) then
        --PositionAnswers()

        rootImage.isVisible = false
        --creating the question depending on the selcetion number
        questionText.text = "which on of these objet has made by humans?"
    --creating answer text from list it corispondes with the animals list
        answerText.text = "All of them"
        --creating wrong answers
        wrongText1.text = "book"
        wrongText2.text = "car"
        wrongText3.text = "Table"
    elseif (randomQuestion == 2) then
       
    --creating the question depending on the selcetion number
        questionText.text = "What is this image of?"
        rootImage.isVisible = true
    --creating answer text from list it corispondes with the animals list
        answerText.text = "Root"
    
            --creating wrong answers
            wrongText1.text = "Leaves"
            wrongText2.text = "Branch"
            wrongText3.text = "Flower"
    elseif (randomQuestion == 3) then
        --creating the question depending on the selcetion number
        questionText.text = "What do plants need\n to grow?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Water"
    
        --creating wrong answers
        wrongText1.text = "Moonlight"
        wrongText2.text = "Juice"
        wrongText3.text = "Darkness"

    elseif (randomQuestion == 4) then
        --creating the question depending on the selcetion number
        questionText.text = "What do the animals need to survive?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "A & B"
        --creating wrong answers
        wrongText1.text = "Water"
        wrongText2.text = "Food"
        wrongText3.text = "Shelter"
    elseif (randomQuestion == 5) then
        --creating the question depending on the selcetion number
        questionText.text = "What kind of trees\n have flowers on them?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Blossom tree"
        --creating wrong answers
        wrongText1.text = "Maple Trees"
        wrongText2.text = "Oak Trees"
        wrongText3.text = "Oval Trees"            
    elseif (randomQuestion == 6) then
        --creating the question depending on the selcetion number
        questionText.text = "Magnets have a North and South pole.\n Which ends would attract each other?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "North & South"
        --creating wrong answers
        wrongText1.text = "South & South"
        wrongText2.text = "North & North"
        wrongText3.text = "They would\n never attract"  
    elseif (randomQuestion == 7) then
     
        --creating the question depending on the selcetion number
        questionText.text = "What thing takes up space?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Matter"
        --creating wrong answers
        wrongText1.text = "Force"
        wrongText2.text = "Energy"
        wrongText3.text = "Metal"    
    elseif (randomQuestion == 8) then
     
        --creating the question depending on the selcetion number
        questionText.text = "What form does ice take in hot temperature?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Liquid"
        --creating wrong answers
        wrongText1.text = "Solid"
        wrongText2.text = "Ice"
        wrongText3.text = "Snow" 
    elseif (randomQuestion == 9) then
        
        --creating the question depending on the selcetion number
        questionText.text = "Which one is the largest planet?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Jupiter"
        --creating wrong answers
        wrongText1.text = "Uranus"
        wrongText2.text = "Neptune"
        wrongText3.text = "Earth"    
    
    elseif (randomQuestion == 10) then
        --creating the question depending on the selcetion number
        questionText.text = "Which surface would be the best for this skating race?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "In a parking lot"
        --creating wrong answers
        wrongText1.text = "small stone"
        wrongText2.text = "Sand"
        wrongText3.text = "Grass"    
    elseif (randomQuestion == 11) then

        --creating the question depending on the selcetion number
        questionText.text = "Which object would take the least force to pick up?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "A pencil"
        --creating wrong answers
        wrongText1.text = "A car"
        wrongText2.text = "A book"
        wrongText3.text = "A table"    
    elseif (randomQuestion == 12) then
 
        --creating the question depending on the selcetion number
        questionText.text = "True / False \n water is a colorless object?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "True"
        --creating wrong answers
        wrongText1.text = "False"
        wrongText2.text = ""
        wrongText3.text = "" 

    elseif (randomQuestion == 13) then
   
        --creating the question depending on the selcetion number
        questionText.text = "If you put water in a bowl from a bottel what will change?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "The Wate\nShape"
        --creating wrong answers
        wrongText1.text = "The Water\nSmell"
        wrongText2.text = "The Water\nSound"
        wrongText3.text = "The Water\nColor"  
    elseif (randomQuestion == 14) then
      
        --creating the question depending on the selcetion number
        questionText.text = "Which one is the smallest object."
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "An eraser"
        --creating wrong answers
        wrongText1.text = "A book"
        wrongText2.text = "A chair"
        wrongText3.text = "A table" 
    elseif (randomQuestion == 15) then
        --creating the question depending on the selcetion number
        questionText.text = "A bicycle and a fan have what type of energy in common?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Mechanical"
        --creating wrong answers
        wrongText1.text = "Electrical"
        wrongText2.text = "Sound"
        wrongText3.text = "Light"  
    elseif (randomQuestion == 19) then
        --creating the question depending on the selcetion number
        questionText.text = "What is the ability to do work?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Energy"
        --creating wrong answers
        wrongText1.text = "Energy forms"
        wrongText2.text = "Potential\nenergy"
        wrongText3.text = "Kinetic\nenergy"     
    elseif (randomQuestion == 20) then
        --creating the question depending on the selcetion number
        questionText.text = "Which of the following is an example of force?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "A boy kicking\n the ball"
        --creating wrong answers
        wrongText1.text = "A ball\nat rest"
        wrongText2.text = "A ball\nrolling"
        wrongText3.text = "A dog\nsleeping"     
     
  

    end

end




-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText.text
    if (touch.phase == "ended") then
        -- adding the pop sound when objects touched 
        --popUpChannel = audio.play(popUp)
      
        audio.play(dingSound)

        -- counting the right answer
        totalAnswer = totalAnswer + 1
        -- make condition for winning the game 
        if(totalAnswer == 6)then
           yourcake()
        else
            DisplayQuestion()
            PositionAnswers()
        end 
    end
end

-- FUNCTION for hidding the correct answer text
local function HideCorrectAnswer( ... )
    giveThenAnswer.isVisible = false
end

--checking to see if the user pressed the right answer 
local function TouchListenerWrongAnswer(touch)
    if (touch.phase == "ended") then
        --PositionAnswers()
        audio.play(buzzSound)
        -- pop sound when the objects touched
       -- popUpChannel = audio.play(popUp)
        -- Displaying the the right answer text
        giveThenAnswer.text = "Sorry, wrong answer. The correct \n answer is ".. answerText.text
        --make the text Visible
        giveThenAnswer.isVisible = true
        numBerWrong = numBerWrong + 1
        -- delaly for hidding the correct answer text
        timer.performWithDelay(1500, HideCorrectAnswer)

        if(numBerWrong == 3) then
            -- delaly for Displaying the you lose screen
            timer.performWithDelay(1000, youLostScreen )
        else
            timer.performWithDelay(1500, DisplayQuestion)
            timer.performWithDelay(1500, PositionAnswers)
        end
        
    end 
end


--checking to see if the user pressed the right answer 
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    if (touch.phase == "ended") then
        --PositionAnswers()
        audio.play(buzzSound)

        --pop sound when the objects touched
        --popUpChannel = audio.play(popUp)
        -- Displaying the correct answer text if the user got wrong
        giveThenAnswer.text = "Sorry wrong answer. The correct \n answer is ".. answerText.text
        -- making the correct answer text Visible
        giveThenAnswer.isVisible = true
        numBerWrong = numBerWrong + 1
        -- delaly for hidding the correct answer text
        timer.performWithDelay(1500, HideCorrectAnswer)

        if(numBerWrong == 3) then
            -- delaly for Displaying the you lose screen
            timer.performWithDelay(1000, youLostScreen )
        else
            timer.performWithDelay(1500, DisplayQuestion)
            timer.performWithDelay(1500, PositionAnswers)
        end 

    end 
end
-- function for 3 wrong answer
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
    if (touch.phase == "ended") then
        audio.play(buzzSound)

        -- DisplayQuestion pop sound when the objects touched
        --popUpChannel = audio.play(popUp)
        -- Displaying the right answer text if the user got it wrong
        giveThenAnswer.text = "Sorry wrong answer. The correct \n answer is ".. answerText.text
        -- making the right answer text Visible
        giveThenAnswer.isVisible = true
        numBerWrong = numBerWrong + 1
        -- delaly for hidding the correct answer text
        timer.performWithDelay(1500, HideCorrectAnswer)

        if(numBerWrong == 3) then
            -- delaly for Displaying the you lose screen
            timer.performWithDelay(1000, youLostScreen )
        else
            timer.performWithDelay(1500, DisplayQuestion)
            timer.performWithDelay(1500, PositionAnswers)
        end
        
    end
end
-- timer counting function 
local function UpdateTime( )
    secondsLeft = secondsLeft - 1
    clockText.text = secondsLeft .. ""
    if(secondsLeft == 0)then
        secondsLeft = totalSeconds
        composer.gotoScene("you_lose2")
    end
end
-- FUNCTION start the timer again
local  function startTimer( )
  countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end


--adding the event listeners to objects
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners from objects
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswer)
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)

    sceneGroup:insert(bkg)

    --setting to a semi black colour
    --bkg:setFillColor(0,0,0,0.5)
   
    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newImageRect("Images/Ferdous2/question mark.png",display.contentWidth, display.contentHeight)
    cover.x = display.contentCenterX
    cover.y = display.contentCenterY
    cover.width = display.contentWidth
    cover.height = display.contentHeight 
    sceneGroup:insert(cover)
    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 35)
    questionText:setTextColor(0/255, 0/255, 255/255)
    --questionText:setFillColor( 0.2, 0.2, 0. )
    sceneGroup:insert(questionText)


    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 35)
    answerText.anchorX = 0
    answerText:setTextColor(255/255, 0/255, 0/255)
    sceneGroup:insert(answerText)

    wrongText1 = display.newText("", X2, Y2, Arial, 35)
    wrongText1.anchorX = 0
    wrongText1:setTextColor(255/255, 0/255, 0/255)
    sceneGroup:insert(wrongText1)

    wrongText2 = display.newText("", X1, Y1, Arial, 35)
    wrongText2.anchorX = 0
    wrongText2:setTextColor(255/255, 0/255, 0/255)
    sceneGroup:insert(wrongText2)

    wrongText3 = display.newText("", X1, Y2, Arial, 35)
    wrongText3.anchorX = 0
    wrongText3:setTextColor(255/255, 0/255, 0/255)
    sceneGroup:insert(wrongText3)

    -- creating the text to give the right answer if the got wrong
    giveThenAnswer =  display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 50)
    giveThenAnswer.x = 500
    giveThenAnswer.y = 500
    giveThenAnswer.isVisible = false
    giveThenAnswer:setTextColor(0, 0, 0.9)
    sceneGroup:insert(giveThenAnswer)

    --creationg bake text
    bakeText =  display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 40)
    bakeText.x = 500
    bakeText.y = 500
    bakeText.isVisible = false
    bakeText:setTextColor(0.4, 0.3, 0.9)
    -----------------------------------------------------------------------------------------
   -- creating roots image
    rootImage = display.newImageRect("Images/Ferdous2/roots.png", display.contentWidth, display.contentHeight) 
    rootImage.x = 500
    rootImage.y = 250
    rootImage.width = 200
    rootImage.height = 200
    rootImage.isVisible = false
    sceneGroup:insert(rootImage)

    --backButton = widget.newButton( 
    --{
    -- Setting Position
    --x = display.contentWidth*15/30,
    --y = display.contentHeight*15/17,
        -- Setting Dimensions
    --width = 150,
    --height = 100,
    -- Setting Visual Properties
    --defaultFile = "Images/Ferdous2/BackToLevel2ButtonPressed@2x.png",
    --overFile = "Images/Ferdous2/BackToLevel2ButtonUnPressedFerdous@2x .png",
    -- Setting Functional Properties
    --onRelease = gotoLevel2Screen
    --})
    --sceneGroup:insert(backButton)

    backButton2 = widget.newButton( 
    {
    -- Setting Position
    x = display.contentWidth*1/1.1,
    y = display.contentHeight*15.6/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
     defaultFile = "Images/Ferdous2/BackButtonUnPressedFerdous@2x.png",
    overFile = "Images/Ferdous2/BackButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
    })
    sceneGroup:insert(backButton2)
    
    -- insert all objects for this scene into the scene group
    -- adding text and colour for timer
    clockText= display.newText(secondsLeft, display.contentWidth/7, display.contentHeight/7, nil, 50)
    clockText.x = 500
    clockText.y = 45
    clockText:setTextColor(0.9, 0, 0)
           --creating mute button
  
    sceneGroup:insert(clockText)


end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
    -----------------------------------------------------------------------------------------
    if ( phase == "will" ) then
        totalAnswer = 0
        numBerWrong = 0

        -- Called when the scene is still off screen (but is about to come on screen).
-----------------------------------------------------------------------------------------
    -- called the FUNCTION to display questions
       
        -- play the background sound
    elseif ( phase == "did" ) then
       
       
        DisplayQuestion()
        -- call the function to change the answers positions
        PositionAnswers()
        -- called texts 
        AddTextListeners()
        -- start timer 
        startTimer()
        if (soundOn == true) then
            musicChannel = audio.play(music, {channel=10, loops= -1})
            audio.setVolume(0.25, {channel=10})
        else
            musicChannel = audio.pause(music, {channel=10, loops= -1})
            audio.pause(musicChannel)
            audio.setVolume(0.25, {channel=10})
        end
        totalAnswer = 0

    end

end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
-----------------------------------------------------------------------------------------
    if ( phase == "will" ) then
         --AddTextListeners()

        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
       
        audio.stop(musicChannel)

        -- call the remove the event listeners FUNCTION
        RemoveTextListeners()
        -- reset scene after leave it 
        --composer.removeScene("level2_questions")
        -- Displaying the background sound
        --canceling the timer
         timer.cancel(countDownTimer)
         secondsLeft = totalSeconds
         totalAnswer = 0
         numBerWrong = 0
    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
-----------------------------------------------------------------------------------------
end 

-----------------------------------------------------------------------------------------
-- ADD EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene