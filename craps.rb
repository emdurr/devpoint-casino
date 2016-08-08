require_relative 'dice_roll.rb'
class Craps
  def initialize
    puts "Welcome to the Craps table!!"
    @dice_roll = Dice.new
  end

  def first_bet
    puts "Would you like to Pass the line?"
    puts "Enter 'back' if you would rather not play."
    user_input = gets.strip.downcase
    binding.pry
    if user_input == 'y'
      puts "How much would you like to bet?"
      puts "Your current wallet total is #{@player.wallet.amount}"
      user_bet = gets.to_f
      @player.wallet.amount -= user_bet
      roll_dice
    elsif user_input == 'back'
      main_menu = Casino.menu

    else
      puts "How much would you like to bet?"
      puts "Your current wallet total is #{@player.wallet.amount}"
      user_bet = gets.to_f
      @player.wallet.amount -= user_bet
      roll_dice
    end
  end

  def roll_dice
    dice_roll_1 = Dice.roll
    puts Dice.show_dice
  end

end
