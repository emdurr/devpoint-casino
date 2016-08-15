require 'pry'

class DiceImages
	attr_accessor :dice_arr
	def initialize
		@dice_arr = [" ---------------\n|               |\n|               |\n|       1       |\n|               |\n|               |\n ---------------",
								 " ---------------\n|               |\n|   2           |\n|               |\n|           2   |\n|               |\n ---------------",
								 " ---------------\n|               |\n|   3           |\n|       3       |\n|           3   |\n|               |\n ---------------",
								 " ---------------\n|               |\n|   4       4   |\n|               |\n|   4       4   |\n|               |\n ---------------",
								 " ---------------\n|               |\n|   5       5   |\n|       5       |\n|   5       5   |\n|               |\n ---------------",
								 " ---------------\n|               |\n|   6       6   |\n|   6       6   |\n|   6       6   |\n|               |\n ---------------"
	]
	end

	def dice_sample
		print "#{@dice_arr.sample}\n#{@dice_arr.sample}\n#{@dice_arr.sample}\n#{@dice_arr.sample}\n#{@dice_arr.sample}\n#{@dice_arr.sample}\n"
		input_1 = gets.to_i
		case input_1
		when 1..6
			puts
		else
			puts "Nope. Try again."
		end
		input_2 = gets.to_i
		case input_2
		when 1..6
			puts
		else
			puts "Nope. Try again."
		end
	end

	def dice_rolling
		#how do I simulate dice rolling?
		
	end
end