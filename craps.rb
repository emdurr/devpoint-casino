require_relative 'dice_roll.rb'
require 'colorize'
class Craps
  attr_accessor :player, :game
  def initialize(player, game)
    @game = game
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
      @game.menu
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
    @bet_placement.each do |check|
      case @total
      when 7
        if @bet_placement.include? 'Pass Line'
          puts "Winner"
          @player.wallet.amount += @bet_total[0]
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Place Bet 4'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Place Bet 5'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Place Bet 6'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Place Bet 8'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Place Bet 9'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Place Bet 10'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Place Bet to Lose 4'
          puts "Winner"
          @player.wallet.amount += 2.2 * @bet_total[0]
        elsif @bet_placement.include? 'Place Bet to Lose 5'
          puts "Winner"
          @player.wallet.amount += 1.6 * @bet_total[0]
        elsif @bet_placement.include? 'Place Bet to Lose 6'
          puts "Winner"
          @player.wallet.amount += 1.25 * @bet_total[0]
        elsif @bet_placement.include? 'Place Bet to Lose 8'
          puts "Winner"
          @player.wallet.amount += 1.25 * @bet_total[0]
        elsif @bet_placement.include? 'Place Bet to Lose 9'
          puts "Winner"
          @player.wallet.amount += 1.6 * @bet_total[0]
        elsif @bet_placement.include? 'Place Bet to Lose 10'
          puts "Winner"
          @player.wallet.amount += 2.2 * @bet_total[0]
        elsif @bet_placement.include? 'Buy Bet 4'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Buy Bet 5'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Buy Bet 6'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Buy Bet 8'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Buy Bet 9'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Buy Bet 10'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Lay Bet 4'
          puts "Winner"
          @player.wallet.amount += 2 * @bet_total[0]
        elsif @bet_placement.include? 'Lay Bet 5'
          puts "Winner"
          @player.wallet.amount += 1.5 * @bet_total[0]
        elsif @bet_placement.include? 'Lay Bet 6'
          puts "Winner"
          @player.wallet.amount += 1.2 * @bet_total[0]
        elsif @bet_placement.include? 'Lay Bet 8'
          puts "Winner"
          @player.wallet.amount += 1.2 * @bet_total[0]
        elsif @bet_placement.include? 'Lay Bet 9'
          puts "Winner"
          @player.wallet.amount += 1.5 * @bet_total[0]
        elsif @bet_placement.include? 'Lay Bet 10'
          puts "Winner"
          @player.wallet.amount += 2 * @bet_total[0]
        elsif @bet_placement.include? 'Field'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Any 7'
          puts "Winner"
          @player.wallet.amount += 4 * @bet_total[0]
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Horn Bet'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        else
          puts
        end
      when 2
        if @bet_placement.include? 'Pass Line'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Winner"
          @player.wallet.amount += @bet_total[0]
        elsif @bet_placement.include? 'Place Bet'
          puts "Push"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Push"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Push"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Push"
        elsif @bet_placement.include? 'Field'
          puts "Double-Win"
          @player.wallet.amount += 2 * @bet_total[0]
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
          @player.wallet.amount -= @bet_total[0]
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Win"
          @player.wallet.amount += @bet_total[0]
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Win"
        else
          puts
        end
      when 3
        if @bet_placement.include? 'Pass Line'
          puts "Lose"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Winner"
        elsif @bet_placement.include? 'Place Bet'
          puts "Push"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Push"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Push"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Push"
        elsif @bet_placement.include? 'Field'
          puts "Winner"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Winner"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Winner"
        else
          puts
        end
      when 4
        if @bet_placement.include? 'Pass Line'
          puts "Push"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Push"
        elsif @bet_placement.include? 'Place Bet'
          puts "Winner if 4"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Lose if 4"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Winner if 4"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Lose if 4"
        elsif @bet_placement.include? 'Field'
          puts "Winner"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Lose"
        else
          puts
        end
      when 5
        if @bet_placement.include? 'Pass Line'
          puts "Push"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Push"
        elsif @bet_placement.include? 'Place Bet'
          puts "Winner if 5"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Lose if 5"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Winner if 5"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Lose if 5"
        elsif @bet_placement.include? 'Field'
          puts "Lose"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Lose"
        else
          puts
        end
      when 6
        if @bet_placement.include? 'Pass Line'
          puts "Push"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Push"
        elsif @bet_placement.include? 'Place Bet'
          puts "Winner if 6"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Lose if 6"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Winner if 6"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Lose if 6"
        elsif @bet_placement.include? 'Field'
          puts "Lose"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Lose"
        else
          puts
        end
      when 8
        if @bet_placement.include? 'Pass Line'
          puts "Push"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Push"
        elsif @bet_placement.include? 'Place Bet'
          puts "Winner if 8"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Lose if 8"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Winner if 8"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Lose if 8"
        elsif @bet_placement.include? 'Field'
          puts "Lose"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Lose"
        else
          puts
        end
      when 9
        if @bet_placement.include? 'Pass Line'
          puts "Push"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Push"
        elsif @bet_placement.include? 'Place Bet'
          puts "Winner if 9"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Lose if 9"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Winner if 9"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Lose if 9"
        elsif @bet_placement.include? 'Field'
          puts "Winner"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Lose"
        else
          puts
        end
      when 10
        if @bet_placement.include? 'Pass Line'
          puts "Push"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Push"
        elsif @bet_placement.include? 'Place Bet'
          puts "Winner if 10"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Lose if 10"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Winner if 10"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Lose if 10"
        elsif @bet_placement.include? 'Field'
          puts "Winner"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Lose"
        else
          puts
        end
      when 11
        if @bet_placement.include? 'Pass Line'
          puts "Winner"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Lose"
        elsif @bet_placement.include? 'Place Bet'
          puts "Push"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Push"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Push"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Push"
        elsif @bet_placement.include? 'Field'
          puts "Winner"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Winner"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Winner"
        else
          puts
        end
      when 12
        if @bet_placement.include? 'Pass Line'
          puts "Push"
        elsif @bet_placement.include? "Don't Pass Line"
          puts "Push"
        elsif @bet_placement.include? 'Place Bet'
          puts "Push"
        elsif @bet_placement.include? 'Place Bet to Lose'
          puts "Push"
        elsif @bet_placement.include? 'Buy Bet'
          puts "Push"
        elsif @bet_placement.include? 'Lay Bet'
          puts "Push"
        elsif @bet_placement.include? 'Field'
          puts "Winner"
        elsif @bet_placement.include? 'Any 7'
          puts "Lose"
        elsif @bet_placement.include? 'Snake Eyes'
          puts "Lose"
        elsif @bet_placement.include? 'Twelve Craps'
          puts "Winner"
        elsif @bet_placement.include? 'Three Craps'
          puts "Lose"
        elsif @bet_placement.include? 'Six Five'
          puts "Lose"
        elsif @bet_placement.include? 'Horn Bet'
          puts "Winner"
        else
          puts
        end
      else
        puts

      end
    end
    #
    # @bet_placement.each do |pull_rule|
    #   case
    #   when
    #
    # end
    # then you have to resolve each one of the bets
    # puts "Win or lose!"
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
      @game.menu
    else
      puts "Invalid selection. Please try again."
      another_bet
    end
  end

end
