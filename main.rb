require_relative './helpers.rb'
# these constants can be whatever you'd like
GRID_HEIGHT = 3
GRID_LENGTH = 3

grid = Array.new(GRID_HEIGHT, Array.new(GRID_LENGTH, '-'))
print_2d_arr(grid)

input_unsuccessful = true

while(input_unsuccessful)
	puts "Who is Player 1? [X/O]"
	player1 = gets.chomp.upcase

	case player1
	when 'X'
		player2 = 'O'
		input_unsuccessful = false
	when 'O'
		player2 = 'X'
		input_unsuccessful = false
	else
		puts "Wrong Input: #{player1} is not an accepted value."
		puts "Try Again..."
	end
end

puts "Input shall be in (row,col) format starting from (0,0) at top left."

tracker = 0
while(!check_victory(grid) && tracker < GRID_LENGTH * GRID_HEIGHT)
	print "Player #{tracker % 2 + 1}: Input location for next "

	if tracker % 2 == 0
		puts "#{player1}:"
		grid = get_input(player1 ,grid)
	else
		puts "#{player2}:"
		grid = get_input(player2, grid)
	end

	print_2d_arr(grid)
	tracker += 1
end
