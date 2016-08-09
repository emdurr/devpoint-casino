require_relative 'dice_roll.rb'
class Craps
  def initialize(player)
    puts "Welcome to the Craps table!!"
    @dice_roll = Dice.new
    @player = player
  end

  def first_bet
    puts "Would you like to Pass the line? y/n"
    puts "Enter 'back' if you would rather not play."
    user_input = gets.strip.downcase
    if user_input == 'y'
      puts "How much would you like to bet?"
      puts "Your current wallet total is #{@player.wallet.amount}"
      @user_bet = gets.to_f
      @player.wallet.amount -= @user_bet
      another_bet
      #roll_dice
    elsif user_input == 'back'
      Casino.new_game
    else
      puts "How much would you like to bet?"
      puts "Your current wallet total is #{@player.wallet.amount}"
      @user_bet = gets.to_f
      @player.wallet.amount -= @user_bet
      another_bet
      #roll_dice_1
    end
  end

  def another_bet
    puts "Would you like to place another bet? y/n"
    user_input = gets.strip.downcase
    if user_input == 'y'
      # how to loop this until the answer is no
    elsif user_input == 'n'
      roll_dice
    else
      puts "Invalid input! Try again."
      another_bet
    end
  end

  def roll_dice
    puts "The dice are out!"
    roll_the_dice = Dice.new
    roll_the_dice.roll
    puts roll_the_dice.show_dice
    total = roll_the_dice.sum_total
    if total == 2
      puts "Aces!"
      puts "You lose!"
      first_bet
    elsif total == 3
      puts "Ace deuce!"
      puts "You lose!"
      first_bet
    elsif total == 4
      puts "Four!"
      dice_roll_2
    elsif total == 5
      puts "Fever!"
      dice_roll_2
    elsif total == 6
      puts "She-hix!"
      dice_roll_2
    elsif total == 7
      puts "Seven!"
      puts "Winner! Winner!"
      @player.wallet.amount = @player.wallet.amount + (2 * @user_bet)
      first_bet
    elsif total == 8
      puts "Eight!"
      dice_roll_2
    elsif total == 9
      puts "Centerfield nine!"
      dice_roll_2
    elsif total == 10
      puts "Tennessee!"
      dice_roll_2
    elsif total == 11
      puts "Yo-leven"
      puts "Winner! Winner!"
    else
      puts "Full boat!"
      puts "Tie"
      @player.wallet.amount += @user_bet
      first_bet
    end
  end

  def roll_dice_1
    puts "The dice are out!"
    roll_the_dice = Dice.new
    roll_the_dice.roll
    puts roll_the_dice.show_dice
    total = roll_the_dice.sum_total
    if total == 2
      puts "Aces!"
      puts "Winner! Winner!"
      @player.wallet.amount = @player.wallet.amount + (2 * @user_bet)
      first_bet
    elsif total == 3
      puts "Ace deuce!"
      puts "Winner! Winner!"
      @player.wallet.amount = @player.wallet.amount + (2 * @user_bet)
      first_bet
    elsif total == 4
      puts "Four!"
      roll_dice_2
    elsif total == 5
      puts "Fever!"
      roll_dice_2
    elsif total == 6
      puts "She-hix!"
      roll_dice_2
    elsif total == 7
      puts "Seven!"
      puts "You lose!"
      first_bet
    elsif total == 8
      puts "Eight!"
      roll_dice_2
    elsif total == 9
      puts "Centerfield nine!"
      roll_dice_2
    elsif total == 10
      puts "Tennessee!"
      roll_dice_2
    elsif total == 11
      puts "Yo-leven"
      puts "You lose!"
      first_bet
    else
      puts "Full boat!"
      puts "Tie"
      @player.wallet.amount += @user_bet
      first_bet
    end
  end

  def roll_dice_2
    puts "The dice are out!"
    roll_the_dice = Dice.new
    roll_the_dice.roll
    puts roll_the_dice.show_dice
    total = roll_the_dice.sum_total
    if total == 2
      puts "Aces!"
    elsif total == 3
      puts "Ace deuce!"
    elsif total == 4
      puts "Four!"
    elsif total == 5
      puts "Fever!"
    elsif total == 6
      puts "She-hix!"
    elsif total == 7
      puts "Seven!"
      puts "You lose!"
      first_bet
    elsif total == 8
      puts "Eight!"
    elsif total == 9
      puts "Centerfield nine!"
    elsif total == 10
      puts "Tennessee!"
    elsif total == 11
      puts "Yo-leven"
    else
      puts "Full boat!"
    end
  end

end
