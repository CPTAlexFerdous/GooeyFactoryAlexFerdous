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
sceneName = "level4_questions"

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-- background color
--display.setDefault("background", 0.9, 0.9, 0.5)

----------------------------------------------------------------------------------------
-- background Music
----------------------------------------------------------------------------------------
local sound = audio.loadStream("Sounds/inspire.mp3")
local soundChannel
-----------------------------------------------------------------------------------------
--Local Sounds
----------------------------------------------------------------------------------------


local buzzSound = audio.loadSound("Sounds/Wrong Buzzer.mp3")
local dingSound = audio.loadSound("Sounds/dingSound.mp3")

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

-- variables for answers texts
local answerText 
local wrongText1
local wrongText2
local wrongText3
local giveThenAnswer
-- answers position variable
--local randomQuestion = 1

--local answerPosition  

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

local numWrong = 0

-- The local variables for the timer
local totalSeconds = 60
local secondsLeft =  60
local clockText
local countDownTimer

local rootImage


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
    time = 300
})
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- function for going back to main menu screen

local function BackTransition()
    composer.gotoScene( "main_menu", transitionOption )
end
-- function for going to level 2 screen 

local function gotoLevel4Screen()
    composer.gotoScene( "level4_screen", transitionOption2 )
end

-- function for going to you win screen
local function yourcake()
    composer.gotoScene("your_cake", transitionOption3)

end
-- FUNCTIONS for going to you lose screen
local function youLostScreen( ... )
    composer.gotoScene("you_lose4", transitionOption4)

end
-- FUNCTIONS changing the answers positions

-- FUNCTIONS changing the answers positions 
local function PositionAnswers()
    --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    print ("***level4_question: answerPosition = " .. answerPosition)

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


local function DisplayQuestion()
    local randomQuestion = math.random (1, 15)


    print ("***level4_question: randomQuestion = " .. randomQuestion)

    if (randomQuestion == 1) then
        rootImage.isVisible = false
        --creating the question depending on the selcetion number
        questionText.text = "What color is the sun light?"
    --creating answer text from list it corispondes with the animals list
        answerText.text = "Yellow"
        --creating wrong answers
        wrongText1.text = "Green"
        wrongText2.text = "Blue"
        wrongText3.text = "Purple"
    elseif (randomQuestion == 2) then
      
        --creating the question depending on the selcetion number
        questionText.text = "What is this image of?"
        rootImage.isVisible = true
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Flower"
        --creating wrong answers
        wrongText1.text = "Leaves"
        wrongText2.text = "Branch"
        wrongText3.text = "Root"
    elseif (randomQuestion == 3) then

        --creating the question depending on the selcetion number
        questionText.text = "What do people need to live?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "All of\nthem"
        --creating wrong answers
        wrongText1.text = "Water"
        wrongText2.text = "Food"
        wrongText3.text = "Shelter"
    elseif (randomQuestion == 5) then
        --creating the question depending on the selcetion number
        questionText.text = "What is the ability to do work?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Energy"
        --creating wrong answers
        wrongText1.text = "Energy forms"
        wrongText2.text = "Potential\nenergy"
        wrongText3.text = "Kinetic\nenergy"     
   
    elseif (randomQuestion == 5) then
 
        --creating the question depending on the selcetion number
        questionText.text = "What is the smallest planet?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Mercury"
        --creating wrong answers
        wrongText1.text = "Earth"
        wrongText2.text = "Venus"
        wrongText3.text = "Mars"    
    elseif (randomQuestion == 6) then
    
        rootImage.isVisible = false
        --creating the question depending on the selcetion number
        questionText.text = "The ability of doing something called?"
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Energy "
        --creating wrong answers
        wrongText1.text = "Force"
        wrongText2.text = "Pressure"
        wrongText3.text = "Inertia"     

     elseif (randomQuestion == 7) then
        --creating the question depending on the selcetion number
        questionText.text = "Which of the following is an example of force?"
        rootImage.isVisible = false
        --creating answer text from list it corispondes with the animals list
        answerText.text = "A boy kicking\n the ball"
        --creating wrong answers
        wrongText1.text = "A ball\nat rest"
        wrongText2.text = "A ball\nrolling"
        wrongText3.text = "A dog\nsleeping"     
     
    elseif (randomQuestion == 8) then
     
        rootImage.isVisible = false
        --creating the question depending on the selcetion number
        questionText.text = " True / False \n do you call the air around the Earth Atmosphere?"
        --creating answer text from list it corispondes with the animals list
        answerText.text = "True"
        --creating wrong answers
        wrongText1.text = "False"
        wrongText2.text = ""
        wrongText3.text = ""    
    elseif (randomQuestion == 9) then
        rootImage.isVisible = false
  
        --creating the question depending on the selcetion number
        questionText.text = "Which of the following\n have different texture?"
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Hollow blocks"
        --creating wrong answers
        wrongText1.text = " Plastic cover"
        wrongText2.text = " Satin cloth"
        wrongText3.text = "Glass"      
    elseif (randomQuestion == 10) then
        rootImage.isVisible = false

        --creating the question depending on the selcetion number
        questionText.text = "In which form does water have a\n definite shape and volume?"
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Ice"
        --creating wrong answers
        wrongText1.text = "Liquid water"
        wrongText2.text = " Water vapor"
        wrongText3.text = "clouds"   
    elseif (randomQuestion == 11) then
        rootImage.isVisible = false
     
        --creating the question depending on the selcetion number
        questionText.text = "Plants need which of the following to live?"
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Air, Water"
        --creating wrong answers
        wrongText1.text = "Oxygen"
        wrongText2.text = "Monnlight"
        wrongText3.text = "Shade And Food" 

    elseif (randomQuestion == 12) then
        rootImage.isVisible = false

        --creating the question depending on the selcetion number
        questionText.text = "True or False\n Sun is bigger than Moon?"
         --creating answer text from list it corispondes with the animals list
        answerText.text = "True"
         --creating wrong answers
        wrongText1.text = "False"
        wrongText2.text = ""
        wrongText3.text = "" 
    elseif (randomQuestion == 13) then
        rootImage.isVisible = false
   
        --creating the question depending on the selcetion number
        questionText.text = " True or False\nEarth is bigger than sun?"
        --creating answer text from list it corispondes with the animals list
        answerText.text = "False"
        --creating wrong answers
        wrongText1.text = "True"
        wrongText2.text = ""
        wrongText3.text = "" 
    elseif (randomQuestion == 14) then
        rootImage.isVisible = false
    
        --creating the question depending on the selcetion number
        questionText.text = "what shape does sun have?"
       --creating answer text from list it corispondes with the animals list
        answerText.text = "Round"
        --creating wrong answers
        wrongText1.text = "rectangle"
        wrongText2.text = "Triangle"
        wrongText3.text = "Square" 
    elseif (randomQuestion == 15) then
        rootImage.isVisible = false
     
        --creating the question depending on the selcetion number
        questionText.text = "What the All pushes and pulls called?"
        --creating answer text from list it corispondes with the animals list
        answerText.text = "Force"
        --creating wrong answers
        wrongText1.text = "Weight"
        wrongText2.text = "Gravity"
        wrongText3.text = "Energy" 
   
    end                      
end




-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    
    if (touch.phase == "ended") then
        
        -- adding the pop sound when objects touched 
        audio.play(dingSound)
        -- counting the right answer
        totalAnswer = totalAnswer + 1
        -- make condition for winning the game 
        if (totalAnswer == 10)then
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

    if (touch.phase == "ended")  then 
        -- pop sound when the objects touched
        --popUpChannel = audio.play(popUp)
        -- Displaying the the right answer text
        audio.play(buzzSound)

        giveThenAnswer.text = "Sorry, wrong answer. The correct \n answer is ".. answerText.text
        --make the text Visible
        giveThenAnswer.isVisible = true
        numWrong = numWrong + 1
        -- delaly for hidding the correct answer text
        timer.performWithDelay(1500, HideCorrectAnswer)

        if(numWrong == 2) then
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

    if (touch.phase == "ended") then
    --pop sound when the objects touched

        --popUpChannel = audio.play(popUp)
        -- Displaying the correct answer text if the user got wrong
        audio.play(buzzSound)

        giveThenAnswer.text = "Sorry wrong answer. The correct \n answer is ".. answerText.text
        -- making the correct answer text Visible
        giveThenAnswer.isVisible = true
        numWrong = numWrong + 1

        -- delaly for making the correct text inVisible
        timer.performWithDelay(1500, HideCorrectAnswer)
        if(numWrong == 2) then
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

    if (touch.phase == "ended") then 
        -- DisplayQuestion pop sound when the objects touched
        --popUpChannel = audio.play(popUp)
        -- Displaying the right answer text if the user got it wrong
        audio.play(buzzSound)

        giveThenAnswer.text = "Sorry wrong answer. The correct \n answer is ".. answerText.text
        -- making the right answer text Visible
        giveThenAnswer.isVisible = true
        numWrong = numWrong + 1

        -- delaly for hidding the right answer
        timer.performWithDelay(1500, HideCorrectAnswer)

        if(numWrong == 2) then
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
        composer.gotoScene("you_lose4")
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


-----------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)
    sceneGroup:insert(bkg)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newImageRect("Images/Ferdous4/question mark.png",display.contentWidth, display.contentHeight)
    cover.x = display.contentCenterX
    cover.y = display.contentCenterY
    cover.width = display.contentWidth
    cover.height = display.contentHeight 
    sceneGroup:insert(cover)
    --create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 40)
    questionText:setTextColor(0/255, 0/255, 255/255)
    sceneGroup:insert(questionText)

    questionText:setFillColor( 0.2, 0.2, 0. )
  

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
    giveThenAnswer:setTextColor(0, 0, 0)
    sceneGroup:insert(giveThenAnswer)

    --creationg bake text
    bakeText =  display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 40)
    bakeText.x = 500
    bakeText.y = 500
    bakeText.isVisible = false
    bakeText:setTextColor(0.4, 0.3, 0.9)
    -----------------------------------------------------------------------------------------
   -- creating roots image
    rootImage = display.newImageRect("Images/Ferdous4/flower.jpg", display.contentWidth, display.contentHeight) 
    rootImage.x = 500
    rootImage.y = 250
    rootImage.width = 200
    rootImage.height = 200
    rootImage.isVisible = false
    sceneGroup:insert(rootImage)

    backButton2 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.2,
    y = display.contentHeight*15/16.5,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/Ferdous4/BackButtonUnPressedFerdous@2x.png",
    overFile = "Images/Ferdous4/BackButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
    })
    sceneGroup:insert(backButton2)
    
    -- adding text and colour for timer
    clockText= display.newText(secondsLeft, display.contentWidth/7, display.contentHeight/7, nil, 50)
    clockText.x = 500
    clockText.y = 45
    clockText:setTextColor(0.9, 0, 0)
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
        numWrong = 0
-- Called when the scene is still off screen (but is about to come on screen).
-----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- called the FUNCTION to display questions
         DisplayQuestion()
        -- call the function to change the answers positions
         PositionAnswers()
            -- called texts 
         AddTextListeners()
        -- start timer 
         startTimer()
        -- play the background sound
        -- display background Music
       if (soundOn == true) then
            soundChannel = audio.play(sound, {channel=11, loops= -1})
            audio.setVolume(0.25, {channel=11})
        else
            soundChannel = audio.play(sound, {channel=11, loops= -1})
            audio.pause(soundChannel)
            audio.setVolume(0.25, {channel=11})
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
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------
    elseif ( phase == "did" ) then
        audio.stop(soundChannel)

        -- call the remove the event listeners FUNCTION
        RemoveTextListeners()
        -- reset scene after leave it 
        --composer.removeScene("level4_questions")
        -- Displaying the background sound
        --soundChannel = audio.stop()
            --canceling the timer
        timer.cancel(countDownTimer)
        secondsLeft = totalSeconds
        totalAnswer = 0
        numWrong = 0
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