require 'colored'
### HELPER FUNCS ###
def print_2d_arr(array = [])
	array.each do |x|
		x.each do |y|
			print y + " "
		end
		print "\n"
	end
end
def all_equal(*args)
	if args.flatten.uniq.length == 1
		if (args.flatten.first == 'X')
			return 'X'
		elsif (args.flatten.first == 'O')
			return 'O'
		end
	else
		return '-'
	end
end
def check_res(result)
	if result == 'X' || result == 'O'
		puts "#{result} wins!".red
		return true
	end

	return false
end
def check_victory(array = [][])
	# horizontal
	for i in 0...array.length
		ans = check_res(all_equal(array[i]))
		return ans if ans
	end
	# diagonal
	helper_arr = []
	helper_arr2 = []

	for i in 0...array.length
		helper_arr << array[i][i]
		helper_arr2 << array[i][array.length - (i + 1)]
	end

	if check_res(all_equal(helper_arr)) || check_res(all_equal(helper_arr2))
		return true
	end
	# vertical
	array.first.length.times do |x|
		helper_arr = []
		for i in 0...array.length
			helper_arr << array[i][x]
		end

		ans = check_res(all_equal(helper_arr))
		return ans if ans
	end

	return false
end
def get_input(x_or_o, array)
	while(true)
		begin
			x,y = gets.chomp.gsub(/(|)/,'').split(',').map(&:to_i)

			if x < array.length && y < array.first.length
				# check if coords are in bounds before accepting them
				if array[x][y] != '-'
					puts "Space Taken. Try again:"
				else
					break
				end
			else
				puts "One or more of your specified coordinates is/are out of bounds."
			end
		rescue
			puts "Invalid input. Try again..."
			next
		end
	end

	new_arr = []
	array.each_with_index do |val,index|
		if index != x
			new_arr << val
		else
			new_arr << val.each_with_index.map{|inner,idx| idx == y ? x_or_o : inner}
		end
	end

	if new_arr[x][y] == x_or_o
		return new_arr
	else
		get_input(x_or_o,array)
	end
end
