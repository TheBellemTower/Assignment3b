-----------------------------------------------------------------------------------------
--
-- main.lua
--
--Created by Ethan Bellem
--Created on March 2018
--
--this program will let people order a more varied pizza
--
-----------------------------------------------------------------------------------------
--Will set up the gui elements
display.setDefault( "background", 0, 1, 1)

local numberOfToppings

local price

local hst

local finalPrice

local size


local toppingBox =  native.newTextField( 1280, 1200, 500, 200 )

local instructions = display.newText( "Enter Number of Toppings 1-4", 515, 1200, native.systemFont, 75)
instructions:setTextColor( 0, 0, 0 )

local instructionsTwo = display.newText( "Pick a Size", display.contentCenterX, 350, native.systemFont, 125)
instructionsTwo:setTextColor( 0, 0, 0 )

local large = display.newText( "Large", 515, 500, native.systemFont, 100)
large:setTextColor( 0, 0, 0 )

local extraLarge = display.newText( "Extra Large", 1500, 500, native.systemFont, 100)
extraLarge:setTextColor( 0, 0, 0 )

local heading = display.newText( "Pizza Shop", display.contentCenterX, 200, native.systemFont, 200)
heading:setTextColor( 0, 0, 0 )

--now i will add the two buttons to choose large or extra large

local buttonL = display.newImageRect( "./assets/sprite/enterButton.png", 450, 300)
buttonL.x = 515
buttonL.y = 700

local buttonXL = display.newImageRect( "./assets/sprite/enterButton.png", 450, 300)
buttonXL.x = 1500
buttonXL.y = 700

--the function will add $6 or $ 10 depending on what size you chose



--  eventlister for both buttons
--big pizza - call onButtonPressed (large)
--smalll pizz - call onButtonPRessed (small)


-- the function will calculate the price of pizza depending on the choices made by the user

local function calculatePrice(pizzaPrice)
    --print(pizzaPrice)
    local numberOfToppings = tonumber(toppingBox.text) 
    local totalPrice = 0
    --print (answer)

-- clearing out the console
    
    instructions.alpha = 0
    instructionsTwo.alpha = 0
    large.alpha = 0
    extraLarge.alpha = 0   
    buttonL.alpha = 0
    buttonXL.alpha = 0
    toppingBox.isVisible = false

if numberOfToppings == 1 then
    totalPrice = pizzaPrice + 1
else 
    if numberOfToppings == 2 then 
        totalPrice = pizzaPrice + 1.75
else 
    if numberOfToppings == 3 then 
        totalPrice = pizzaPrice + 2.50
else 
    if numberOfToppings == 4 then 
        totalPrice = pizzaPrice + (3.35)
    else
        local errorText = display.newText("Invalid Entry Number of Toppings should be between 1 and 4", display.contentCenterX, display.contentCenterY, native.systemFont, 75)
    end
end
end

end

-- Calulate the HST and total Price
local HST = totalPrice *.13
local totalPriceWHST = totalPrice + HST

-- Display the total prices and round to 2 decimal places
local subtotalText = display.newText( "Price: $" .. string.format("%.2f",totalPrice), display.contentCenterX, display.contentCenterY+100, native.systemFont, 75 )
local subtotalText2 = display.newText( "HST: $" .. string.format("%.2f",HST), display.contentCenterX, display.contentCenterY+200, native.systemFont, 75 )
local subtotalText3 = display.newText( "Total Price: $" .. string.format("%.2f",totalPriceWHST), display.contentCenterX, display.contentCenterY+300, native.systemFont, 75 )

end

local function onButtonPressedTwo( event )
    local size = 6

    calculatePrice(size)

end

local function onButtonPressedThree( event )
    local size = 10

    calculatePrice(size)
end

buttonL:addEventListener( "touch", onButtonPressedTwo)
buttonXL:addEventListener( "touch", onButtonPressedThree)