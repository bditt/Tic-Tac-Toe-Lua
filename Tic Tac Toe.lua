local printf = function(s,...)
	return print(s:format(...))
end

math.randomseed(os.time())

-- Define variables for later.
local winner = false
local winnername
local isxturn = true
local board

-- Define functions for later.
local printboard
local showturn
local checkforwin
local botturn


board = {
	'1', '2', '3',
	'4', '5', '6',
	'7', '8', '9'
}

printboard = function(theboard)
	printf("%s | %s | %s", theboard[1], theboard[2], theboard[3])
	printf("%s | %s | %s", theboard[4], theboard[5], theboard[6])
	printf("%s | %s | %s", theboard[7], theboard[8], theboard[9])
end

showturn = function(xturn, theboard)
	local choice = io.read("*number")
	if (type(choice) == "number") then
		if theboard[choice] == "X" or theboard[choice] == "O" then
			print("Spot occupied! Please choose again!")
			showturn(xturn, theboard)
		else
			if xturn then
				theboard[choice] = "X"
			else
				theboard[choice] = "O"
			end
		end
	else
		print("Please enter a number!")
		showturn()
	end
end

checkforwin = function(theboard)
	local thewinner
	local thewinnername
	if theboard[1] == "X" and theboard[2] == "X" and theboard[3] == "X" then
		thewinner = true
		thewinnername = "X"
	
	elseif theboard[4] == "X" and theboard[5] == "X" and theboard[6] == "X" then
		thewinner = true
		thewinnername = "X"
	
	elseif theboard[7] == "X" and theboard[8] == "X" and theboard[9] == "X" then
		thewinner = true
		thewinnername = "X"
	
	elseif theboard[1] == "X" and theboard[4] == "X" and theboard[7] == "X" then
		thewinner = true
		thewinnername = "X"
	
	elseif theboard[2] == "X" and theboard[5] == "X" and theboard[8] == "X" then
		thewinner = true
		thewinnername = "X"
	
	elseif theboard[3] == "X" and theboard[6] == "X" and theboard[9] == "X" then
		thewinner = true
		thewinnername = "X"
	
	elseif theboard[1] == "X" and theboard[5] == "X" and theboard[9] == "X" then
		thewinner = true
		thewinnername = "X"
	
	elseif theboard[1] == "X" and theboard[2] == "X" and theboard[3] == "X" then
		thewinner = true
		thewinnername = "X"
	
	elseif theboard[1] == "O" and theboard[2] == "O" and theboard[3] == "O" then
		thewinner = true
		thewinnername = "O"
	
	elseif theboard[4] == "O" and theboard[5] == "O" and theboard[6] == "O" then
		thewinner = true
		thewinnername = "O"
	
	elseif theboard[7] == "O" and theboard[8] == "O" and theboard[9] == "O" then
		thewinner = true
		thewinnername = "O"
	
	elseif theboard[1] == "O" and theboard[4] == "O" and theboard[7] == "O" then
		thewinner = true
		thewinnername = "O"
	
	elseif theboard[2] == "O" and theboard[5] == "O" and theboard[8] == "O" then
		thewinner = true
		thewinnername = "O"
	
	elseif theboard[3] == "O" and theboard[6] == "O" and theboard[9] == "O" then
		thewinner = true
		thewinnername = "O"
	
	elseif theboard[1] == "O" and theboard[5] == "O" and theboard[9] == "O" then
		thewinner = true
		thewinnername = "O"
	
	elseif theboard[1] == "O" and theboard[2] == "O" and theboard[3] == "O" then
		thewinner = true
		thewinnername = "O"
		
	elseif theboard[1] ~= "1" and theboard[2] ~= "2" and theboard[3] ~= "3" and theboard[4] ~= "4" and theboard[5] ~= "5" and theboard[6] ~= "6" and theboard[7] ~= "7" and theboard[8] ~= "8" and theboard[9] ~= "9" then
		thewinner = true
		thewinnername = "D"
	else
		thewinner = false
		thewinnername = ""
	end
	return thewinner, thewinnername
end

botturn = function(theboard)
	-- Check all sideway variations for a possible O win.
	if theboard[1] == "O" and theboard[2] == "O" and theboard[3] == "3" then
		theboard[3] = "O"
	
	elseif theboard[4] == "O" and theboard[5] == "O" and theboard[6] == "6" then
		theboard[6] = "O"
		
	elseif theboard[7] == "O" and theboard[8] == "O" and theboard[9] == "9" then
		theboard[9] = "O"
		
	elseif theboard[1] == "1" and theboard[2] == "O" and theboard[3] == "O" then
		theboard[1] = "O"
	
	elseif theboard[4] == "4" and theboard[5] == "O" and theboard[6] == "O" then
		theboard[4] = "O"
	
	elseif theboard[7] == "7" and theboard[8] == "O" and theboard[9] == "O" then
		theboard[7] = "O"
		
	elseif theboard[1] == "O" and theboard[2] == "2" and theboard[3] == "O" then
		theboard[2] = "O"
		
	elseif theboard[4] == "O" and theboard[5] == "5" and theboard[6] == "O" then
		theboard[5] = "O"
		
	elseif theboard[7] == "O" and theboard[8] == "8" and theboard[9] == "O" then
		theboard[8] = "O"
	
	-- Check all down/up variations for a possible O win.
	elseif theboard[1] == "O" and theboard[4] == "O" and theboard[7] == "7" then
		theboard[7] = "O"
	
	elseif theboard[2] == "O" and theboard[5] == "O" and theboard[8] == "8" then
		theboard[8] = "O"
	
	elseif theboard[3] == "O" and theboard[6] == "O" and theboard[9] == "9" then
		theboard[9] = "O"
	
	elseif theboard[1] == "1" and theboard[4] == "O" and theboard[7] == "O" then
		theboard[1] = "O"
	
	elseif theboard[2] == "2" and theboard[5] == "O" and theboard[8] == "O" then
		theboard[2] = "O"
	
	elseif theboard[3] == "3" and theboard[6] == "O" and theboard[9] == "O" then
		theboard[3] = "O"
		
	elseif theboard[1] == "O" and theboard[4] == "4" and theboard[7] == "0" then
		theboard[4] = "O"
	
	elseif theboard[2] == "O" and theboard[5] == "5" and theboard[8] == "O" then
		theboard[5] = "O"
	
	elseif theboard[3] == "O" and theboard[6] == "6" and theboard[9] == "O" then
		theboard[6] = "O"
	
	-- Check all diagonal variations for a possible O win.
	elseif theboard[1] == "O" and theboard[5] == "O" and theboard[9] == "9" then
		theboard[9] = "O"
	
	elseif theboard[1] == "1" and theboard[5] == "O" and theboard[9] == "O" then
		theboard[1] = "O"
	
	elseif theboard[3] == "O" and theboard[5] == "O" and theboard[7] == "7" then
		theboard[7] = "O"
	
	elseif theboard[3] == "3" and theboard[5] == "O" and theboard[7] == "O" then
		theboard[3] = "O"
		
	elseif theboard[1] == "O" and theboard[5] == "5" and theboard[9] == "O" then
		theboard[5] = "O"
	
	elseif theboard[3] == "0" and theboard[5] == "5" and theboard[7] == "O" then
		theboard[5] = "O"
	
	-- Check all sideway variations for a possible X win.
	elseif theboard[1] == "X" and theboard[2] == "X" and theboard[3] == "3" then
		theboard[3] = "O"
	
	elseif theboard[4] == "X" and theboard[5] == "X" and theboard[6] == "6" then
		theboard[6] = "O"
	
	elseif theboard[7] == "X" and theboard[8] == "X" and theboard[9] == "9" then
		theboard[9] = "O"
	
	elseif theboard[1] == "1" and theboard[2] == "X" and theboard[3] == "X" then
		theboard[1] = "O"
	
	elseif theboard[4] == "4" and theboard[5] == "X" and theboard[6] == "X" then
		theboard[4] = "O"
	
	elseif theboard[7] == "7" and theboard[8] == "X" and theboard[9] == "X" then
		theboard[7] = "O"
		
	elseif theboard[1] == "X" and theboard[2] == "2" and theboard[3] == "X" then
		theboard[2] = "O"
		
	elseif theboard[4] == "X" and theboard[5] == "5" and theboard[6] == "X" then
		theboard[5] = "O"
		
	elseif theboard[7] == "X" and theboard[8] == "8" and theboard[9] == "X" then
		theboard[8] = "O"
	
	-- Check all down/up variations for a possible X win.
	elseif theboard[1] == "X" and theboard[4] == "X" and theboard[7] == "7" then
		theboard[7] = "O"
	
	elseif theboard[2] == "X" and theboard[5] == "X" and theboard[8] == "8" then
		theboard[8] = "O"
	
	elseif theboard[3] == "X" and theboard[6] == "X" and theboard[9] == "9" then
		theboard[9] = "O"
	
	elseif theboard[1] == "1" and theboard[4] == "X" and theboard[7] == "X" then
		theboard[1] = "O"
	
	elseif theboard[2] == "2" and theboard[5] == "X" and theboard[8] == "X" then
		theboard[2] = "O"
	
	elseif theboard[3] == "3" and theboard[6] == "X" and theboard[9] == "X" then
		theboard[3] = "O"
	
	elseif theboard[1] == "X" and theboard[4] == "4" and theboard[7] == "X" then
		theboard[4] = "O"
	
	elseif theboard[2] == "X" and theboard[5] == "5" and theboard[8] == "X" then
		theboard[5] = "O"
	
	elseif theboard[3] == "X" and theboard[6] == "6" and theboard[9] == "X" then
		theboard[6] = "O"
	
	-- Check all diagonal variations for a possible X win.
	elseif theboard[1] == "X" and theboard[5] == "X" and theboard[9] == "9" then
		theboard[9] = "O"
	
	elseif theboard[1] == "1" and theboard[5] == "X" and theboard[9] == "X" then
		theboard[1] = "O"
	
	elseif theboard[3] == "X" and theboard[5] == "X" and theboard[7] == "7" then
		theboard[7] = "O"
	
	elseif theboard[3] == "3" and theboard[5] == "X" and theboard[7] == "X" then
		theboard[3] = "O"
	
	elseif theboard[3] == "X" and theboard[5] == "5" and theboard[7] == "X" then
		theboard[5] = "O"
	
	elseif theboard[1] == "X" and theboard[5] == "5" and theboard[9] == "X" then
		theboard[5] = "O"
	
	-- Randomly choose a spot on the board.
	else
		local randomspot = math.random(1,9)
		print(randomspot)
		if theboard[randomspot] ~= "O" and theboard[randomspot] ~= "X" then
			theboard[randomspot] = "O"
		else
			botturn(theboard)
		end
	end
end

while not winner do
	if isxturn then
		printboard(board)
		print("X's turn. Please select an unoccupied spot.")
		showturn(isxturn, board)
		winner, winnername = checkforwin(board)
		isxturn = false
	else
		botturn(board)
		winner, winnername = checkforwin(board)
		isxturn = true
	end
end
printboard(board)
if winnername == "D" then
	printf("This game was a draw!")
else
	printf("The winner is %s!", winnername)
end