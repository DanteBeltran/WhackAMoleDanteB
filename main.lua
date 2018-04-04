-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Dante Beltran
-- Course: ICS2O/3C
-- This program makes makes an object appear on the screen for an amount of time and 
--then disappears, if the user clicks on the object, his or her score increases by 1
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Creating Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight)

	-- Setting Color
	bkg:setFillColor( 0.5, 1, 0 )

	-- Setting Position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

-- Creating Mole
local mole = display.newImage( "Images/mole.png" , 0, 0)

	-- Setting Position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	-- scale down the size of the mole
	mole:scale( 0.3, 0.3 )

	-- Setting visibility
	mole.isVisible = false
	
-- create a score
local score = 0
local scoreText = display.newText("Score = 0", display.contentCenterX, 50, nil, 50)
scoreText:setTextColor(1, 0, 0)

----------------------------------------Functions------------------------------------

-- This function that makes the mole appear in a random (x,y) position on the screen
--  before calling the Hide function
function PopUp()

	-- Choosing random position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )

	-- Make the mole visible
	mole.isVisible = true

	timer.performWithDelay( 500, Hide )
end

-- This function calls the PopUp function after 3 seconds
function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp )
end

-- This function makes the mole invisible and then calls the PopUpDelay function
function Hide( )

	-- Changing Visibility
	mole.isVisible = false

	--call the function
	PopUpDelay()
end

-- This function starts the game
function GameStart( )
	PopUpDelay()
end

-- This function increments the score only if the mole is clicked. It then displays the
-- new score
function Whacked( event )

	-- If touch phase just started
	if (event.phase == "began") then
		score = score + 1
		scoreText.text = "Points = " .. score
		mole.isVisible = false

	end

end

----------------------------------Event Listeners-------------------------------------
-- I add the event listener to the moles so that if the mole is touched, the Whacked function 
-- is called
mole:addEventListener( "touch", Whacked )

------------------------------------Start Game----------------------------------------

GameStart()
