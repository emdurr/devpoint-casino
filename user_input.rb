class UserInput
	attr_accessor :player, :game
	def initialize(player, game)
		@player = player
		@game = game

	end

	def gather
		puts "Press 'Q' to exit."
		@user_input = gets.strip.downcase
		if @user_input == 'q'
			@game.menu
		elsif @user_input == 'y'
			return true
		elsif @user_input == 'n'
			return false
		else						
			return @user_input
		end
	end

end
