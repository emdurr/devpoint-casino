require 'pry'
require_relative 'user_input.rb'
require_relative 'dice_images.rb'
require_relative 'dice_roll.rb'

class CrapsWin
	attr_accessor :player, :game
	def initialize#(player, game)
		@player = player
		@game = game
		@available_bets = ['Pass Line', "Don't Pass Line",
                       'Place Bet, Place Bet to Lose, Buy Bet, or Lay Bet',
                       'Field', 'Any 7', 'Any Craps', 'Snake Eyes', 'Twelve Craps',
                       'Hard Bet',
                       'Three Craps', 'Six Five',
                       'Horn Bet']
    @bets = ['Place Bet', 'Place Bet to Lose', 'Buy Bet', 'Lay Bet']
    @bet_potential = []
    @bet_placed = []
    @dice_options = [{'total' => 2, 'saying' => 'Aces!'},
                     {'total' => 3, 'saying' => 'Ace deuce!'},
                     {'total' => 4, 'saying' => 'Four!'},
                     {'total' => 5, 'saying' => 'Fever!'},
                     {'total' => 6, 'saying' => 'She-hix!'},
                     {'total' => 7, 'saying' => 'Seven!'},
                     {'total' => 8, 'saying' => 'Eight!'},
                     {'total' => 9, 'saying' => 'Centerfield nine!'},
                     {'total' => 10, 'saying' => 'Tennessee!'},
                     {'total' => 11, 'saying' => 'Yo-leven!'},
                     {'total' => 12, 'saying' => 'Full Boat!'}
                    ]

	end

	def first_bet
		counter = 1
		puts "Choose your bet:"
		@available_bets.each do |list|
			puts "#{counter}. #{list}"
			counter += 1
		end
		@user_input = UserInput.new(@player, @game)
		user_input_a = @user_input.gather.to_i
		bet_poss = @available_bets[user_input_a -1]
		if @available_bets.include?(bet_poss)
			if bet_poss == 'Place Bet, Place Bet to Lose, Buy Bet, or Lay Bet'
				place_bet
			elsif bet_poss == 'Hard Bet'
					hard_bet
			else
				puts "Bet placed on #{bet_poss}!"
			end
		else
			puts "Invalid selection! Please try again!"
			first_bet
		end
		@bet_potential << bet_poss
		bet_amount
	end

	def place_bet
		options = [4, 5, 6, 8, 9, 10]
		puts "Which bet type would you like to place?"
		puts @bets.join(", ")
		user_input_1 = gets.strip
		if @bets.include? user_input_1
			puts "Which number would you like to place your bet on?"
			puts options.join(" ")
			user_input = gets.to_i
			if options.include? user_input
				puts "Bet placed on #{user_input}"
			else
				puts "Invalid selection! Please try again."
				place_bet
			end
		else
			puts "Invalid selection! Please try again."
			place_bet
		end
		bet_placed_1 = user_input_1 + ' ' + user_input.to_s
		@bet_potential << bet_placed_1
		bet_amount
	end

	def hard_bet
		options = [4, 6, 8, 10]
		puts "Which number do you bet will be rolled hard?"
		user_input_2 = gets.to_i
		if options.include? user_input_2
			puts "Bet placed on Hard #{user_input_2}"
		else
			puts "Invalid selection! Please try again"
			hard_bet
		end
		hard_bet_placed = 'Hard ' + user_input_2.to_s
		@bet_potential << hard_bet_placed
	end

	def bet_amount
		puts "How much will you be betting on #{@bet_potential.last}?"
		user_input = UserInput.new(@player, @game)
		user_input_a = @user_input.gather.to_i
		puts "You're betting #{user_input_a} on #{@bet_potential.last}."
		puts "Is that correct? y/n"
		user_input_3 = gets.strip.downcase
		if user_input_3 == 'y'
			@bet_placed << {bet: @bet_potential.last, betamount: user_input_a}
			puts "Excellent!"
			again
		elsif user_input_3 == 'n'
			puts "Alright...Let's try this again..."
			bet_amount
		else
			puts "Invalid Selection. Try again."
			bet_amount
		end	
	end

	def again
		puts "Would you like to place another bet? y/n"
		user_input_4 = gets.strip.downcase
		if user_input_4 == 'y'
			first_bet
		elsif user_input_4 == 'n'
			puts "Perfect! Choose your dice!!"
			choose = DiceImages.new
			choose.dice_sample
			rolling
		else
			puts "You're not very good at this, are you? Try again :/"
			again
		end
	end

	def rolling
		pics = DiceImages.new
		puts "Dice out!"
		puts
    puts " **** Rolling ****"
    puts
    roll_the_dice = Dice.new
    roll_the_dice.roll
    binding.pry
    puts pics.dice_arr.sample
    sleep 0.5
    puts pics.dice_arr.sample
    sleep 0.5
    puts pics.dice_arr.sample
    sleep 0.5
    puts 
    puts
    puts
    puts pics.dice_arr[roll_the_dice.die1 - 1]
    puts pics.dice_arr[roll_the_dice.die2 - 1]
    puts roll_the_dice.show_dice
    @total = roll_the_dice.sum_total
    puts "#{@dice_options[@total - 2]['saying']}"
    puts
    # bet_resolution
	end

end

lets_begin = CrapsWin.new#(player, game)

lets_begin.first_bet