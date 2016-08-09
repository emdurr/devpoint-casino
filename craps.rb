require_relative 'dice_roll.rb'
class Craps
  def initialize(player)
    puts "Welcome to the Craps table!!"
    @dice_roll = Dice.new
    @player = player
    @available_bets = ['Pass Line', 'Pass Line Odds', "Don't Pass Line", "Don't Pass Line Odds",
                       {'Place Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Place Bet to Lose': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Buy Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       {'Lay Bet': ['4', '5', 'Six', '8', 'Nine', '10']},
                       'Big 6', 'Big 8', 'Field', 'Hard 4', 'Hard 6', 'Hard 8',
                       'Hard 10', 'Any 7', 'Any Craps', 'Snake Eyes', 'Twelve Craps',
                       'Three Craps', 'Six Five',
                       'Horn Bet']
    @counter = 1
    @bet_placement = []
  end

  def first_bet
    puts "Choose a bet to place:"
    puts "Enter 'exit' to quit Craps."
    @available_bets.each do |el|
      puts "#{@counter}: #{el}"
      @counter += 1
    end
    @counter = 1
    user_input = gets.strip.downcase
    if user_input == 'exit'
      Casino.new_game
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

  # def first_bet
  #   puts "Would you like to Pass the line? y/n"
  #   puts "Enter 'back' if you would rather not play."
  #   user_input = gets.strip.downcase
  #   if user_input == 'y'
  #     puts "How much would you like to bet?"
  #     puts "Your current wallet total is #{@player.wallet.amount}"
  #     @user_bet = gets.to_f
  #     @player.wallet.amount -= @user_bet
  #     another_bet
  #     #roll_dice
  #   elsif user_input == 'back'
  #     Casino.new_game
  #   else
  #     puts "How much would you like to bet?"
  #     puts "Your current wallet total is #{@player.wallet.amount}"
  #     @user_bet = gets.to_f
  #     @player.wallet.amount -= @user_bet
  #     another_bet
  #   end
  # end

  # def another_bet
  #   puts "Would you like to place another bet? y/n"
  #   user_input = gets.strip.downcase
  #   while user_input == 'y'
  #     available_bets = ['Field', []]
  #     # how to loop this until the answer is no
  #   elsif user_input == 'n'
  #     roll_dice
  #   else
  #     puts "Invalid input! Try again."
  #     another_bet
  #   end
  # end

  def roll_dice
    puts "The dice are out!"
    puts
    puts " **** Rolling ****"
    puts
    roll_the_dice = Dice.new
    roll_the_dice.roll
    puts roll_the_dice.show_dice
    @total = roll_the_dice.sum_total
    if @total == 2
      puts "Aces!"
      #puts "You lose!"
      again
    elsif @total == 3
      puts "Ace deuce!"
      #puts "You lose!"
      again
    elsif @total == 4
      puts "Four!"
      again
    elsif @total == 5
      puts "Fever!"
      again
    elsif @total == 6
      puts "She-hix!"
      again
    elsif @total == 7
      puts "Seven!"
      #puts "Winner! Winner!"
      #@player.wallet.amount = @player.wallet.amount + (2 * @user_bet)
      again
    elsif @total == 8
      puts "Eight!"
      again
    elsif @total == 9
      puts "Centerfield nine!"
      again
    elsif @total == 10
      puts "Tennessee!"
      again
    elsif @total == 11
      puts "Yo-leven"
      #puts "Winner! Winner!"
      #@player.wallet.amount = @player.wallet.amount + (2 * @user_bet)
      again
    else
      puts "Full boat!"
      #puts "Tie"
      #@player.wallet.amount += @user_bet
      again
    end
  end

  def again
    puts
    puts "Would you like to go again? y/n"
    user_input_4 = gets.strip.downcase
    if user_input_4 == 'y'
      puts "Let's do this!"
      first_bet
    elsif user_input_4 == 'n'
      puts "Thanks for rolling!!"
      Casino.new_game
    else
      puts "Invalid selection. Please try again."
      another_bet
    end
  end
  #
  # def roll_dice_1
  #   puts "The dice are out!"
  #   roll_the_dice = Dice.new
  #   roll_the_dice.roll
  #   puts roll_the_dice.show_dice
  #   total = roll_the_dice.sum_total
  #   if total == 2
  #     puts "Aces!"
  #     puts "Winner! Winner!"
  #     @player.wallet.amount = @player.wallet.amount + (2 * @user_bet)
  #     first_bet
  #   elsif total == 3
  #     puts "Ace deuce!"
  #     puts "Winner! Winner!"
  #     @player.wallet.amount = @player.wallet.amount + (2 * @user_bet)
  #     first_bet
  #   elsif total == 4
  #     puts "Four!"
  #     roll_dice_2
  #   elsif total == 5
  #     puts "Fever!"
  #     roll_dice_2
  #   elsif total == 6
  #     puts "She-hix!"
  #     roll_dice_2
  #   elsif total == 7
  #     puts "Seven!"
  #     puts "You lose!"
  #     first_bet
  #   elsif total == 8
  #     puts "Eight!"
  #     roll_dice_2
  #   elsif total == 9
  #     puts "Centerfield nine!"
  #     roll_dice_2
  #   elsif total == 10
  #     puts "Tennessee!"
  #     roll_dice_2
  #   elsif total == 11
  #     puts "Yo-leven"
  #     puts "You lose!"
  #     first_bet
  #   else
  #     puts "Full boat!"
  #     puts "Tie"
  #     @player.wallet.amount += @user_bet
  #     first_bet
  #   end
  # end
  #
  # def roll_dice_2
  #   puts "The dice are out!"
  #   roll_the_dice = Dice.new
  #   roll_the_dice.roll
  #   puts roll_the_dice.show_dice
  #   total = roll_the_dice.sum_total
  #   if total == 2
  #     puts "Aces!"
  #   elsif total == 3
  #     puts "Ace deuce!"
  #   elsif total == 4
  #     puts "Four!"
  #   elsif total == 5
  #     puts "Fever!"
  #   elsif total == 6
  #     puts "She-hix!"
  #   elsif total == 7
  #     puts "Seven!"
  #     puts "You lose!"
  #     first_bet
  #   elsif total == 8
  #     puts "Eight!"
  #   elsif total == 9
  #     puts "Centerfield nine!"
  #   elsif total == 10
  #     puts "Tennessee!"
  #   elsif total == 11
  #     puts "Yo-leven"
  #   else
  #     puts "Full boat!"
  #   end
  # end

end
