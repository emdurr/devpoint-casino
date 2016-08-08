require_relative 'dice_roll.rb'
class Craps
  def initialize(wallet)
    puts "Welcome to the Craps table!!"
    @wallet = wallet
    @dice_roll = Dice.new
  end

  def first_bet
    puts "Would you like to Pass the line?"
    puts "Enter 'back' if you would rather not play."
    user_input = gets.strip.downcase
    if user_input == 'y'
      puts "How much would you like to bet?"
      puts "Your current wallet total is #{@wallet}"
      user_bet = gets.to_f
      @wallet -= user_bet
      roll_dice
    elsif user_input == 'back'
      main_menu = @menu.new(@wallet)
    else
      puts "How much would you like to bet?"
      puts "Your current wallet total is #{@wallet}"
      user_bet = gets.to_f
      @wallet -= user_bet
      roll_dice
    end
  end

  def roll_dice
    dice_roll_1 = Dice.roll
    puts Dice.show_dice
  end

end
