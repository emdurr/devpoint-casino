require_relative 'dice_roll.rb'
require 'colorize'
class Craps
  attr_accessor :player
  def initialize(player)
    puts "Welcome to the Craps table!!"
    @dice_roll = Dice.new
    @player = player
    @available_bets = ['Pass Line', 'Pass Line Odds', "Don't Pass Line", "Don't Pass Line Odds",
                       {'Place Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Place Bet to Lose': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Buy Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Lay Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       'Big 6', 'Big 8', 'Field', 'Any 7', 'Any Craps', 'Snake Eyes', 'Twelve Craps',
                       'Three Craps', 'Six Five',
                       'Horn Bet']
    @counter = 1
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
    @bet_placement = []
    @bet_total = []
  end

  def first_bet
    puts "Choose a bet to place:"
    puts "Type 'Q' if you would like to leave Craps."
    @available_bets.each do |el|
      puts "#{@counter}: #{el}"
      @counter += 1
    end
    @counter = 1
    user_input = gets.strip.downcase
    if user_input == 'q'
      GameMenu.new(@player)
      #Casino.new_game
    else
      game_to_play = user_input.to_i
    end
    @bet_placement << @available_bets[game_to_play - 1]
    puts "You are betting on #{@bet_placement.join("")}"
    bet_amount
  end

  def bet_amount
    puts "How much would you like to bet of your #{@player.wallet.amount} amount?"
    puts "Enter 'back' to go back to placing a bet."
    user_input_1 = gets.strip.downcase
    if user_input_1 == 'back'
      first_bet
    else
      wager = user_input_1.to_i
    end
    puts "All bets are final. Are you sure you want to bet #{wager}? y/n"
    user_input_2 = gets.strip.downcase
    if user_input_2 == 'y'
      puts "Bet accepted!"
      @bet_total << wager
      another_bet
    elsif user_input_2 == 'n'
      puts "Bet refused!"
      bet_amount
    else
      puts "Invalid selection. Please try again."
      bet_amount
    end
  end

  def another_bet
    puts "Would you like to place another bet? y/n"
    user_input_3 = gets.strip.downcase
    if user_input_3 == 'y'
      puts "Perfect!"
      first_bet
    elsif user_input_3 == 'n'
      roll_dice
    else
      puts "Invalid selection. Please try again."
      another_bet
    end
  end

  def roll_dice
    puts "The dice are out!"
    puts
    puts " **** Rolling ****"
    puts
    roll_the_dice = Dice.new
    roll_the_dice.roll
    puts roll_the_dice.show_dice
    @total = roll_the_dice.sum_total
    puts @dice_options[@total - 2]['display']
    bet_resolution
  end

  def bet_resolution
    # 'Pass Line' = Win when 7/11 is rolled on firt roll otherwise the winning roll for
        # 'Pass Line' becomes the number that is rolled
        # = Lose 2,3,12
    # "Don't Pass Line" = Win when 2,3,12 is rolled on first roll otherwise the winning
        # roll becomes the number that is rolled
        # , "Don't Pass Line Odds",
                       {'Place Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Place Bet to Lose': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Buy Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Lay Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       'Big 6', 'Big 8', 'Field', 'Any 7', 'Any Craps', 'Snake Eyes', 'Twelve Craps',
                       'Three Craps', 'Six Five',
                       'Horn Bet'
    # first you have to decide if they win or Lose
    @bet_placement.each do |pull_rule|

    end
    # then you have to resolve each one of the bets
    puts "Win or lose!"
    again
  end

  def again
    puts
    puts "Would you like to go again? y/n"
    user_input_4 = gets.strip.downcase
    if user_input_4 == 'y'
      puts "Let's do this!"
      @bet_placement.clear
      first_bet
    elsif user_input_4 == 'n'
      puts "Thanks for rolling!!"
      puts
      GameMenu.new(@player)
    else
      puts "Invalid selection. Please try again."
      another_bet
    end
  end

end
