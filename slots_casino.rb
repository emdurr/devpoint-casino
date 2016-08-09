require_relative 'player.rb'
require-relative 'menu.rb'

class Slots_casino
  attr_accessor :player
  def initialize(player)
    @player = player
    @slots = ['A', 'J', '7']
  end

  # hash that associates the number with a symbol  (bonus)

  def menu
    puts "Welcome to Slots! Press '1' to continue. Press Q to quit the game."
    input = gets.chomp.downcase
      if input == "q"
      GameMenu.new(@player)
      elsif input == '1'
      pull
      else
      puts "Please try another entry."
      menu
      end
  end


  def pull
    puts "Ready?\n Let's play.\n Press any key to play." # would like it to be return instead of "key"
    lever = gets.chomp
    @slot_1 = @slots.sample  # calls the slot array 3 times randomly to get result
    @slot_2 = @slots.sample
    @slot_3 = @slots.sample
    print "#{@slot_1} #{@slot_2} #{@slot_3}\n"
    results
  end
  def results
    if @slot_1 == @slot_2 && @slot_1 == @slot_3
      puts "!!!JACKPOT!!!\n $10.00 will be added to your Wallet."
      @player.wallet.amount += 10
      puts " Spin again? (yes/no)"
      choice = gets.chomp.downcase
      if choice == "yes" || choice == "y"
        pull
      else
        menu
      end

    elsif @slot_1 == @slot_2
      puts " You Win!\n $5.00 will be added to your Wallet."
      @player.wallet.amount += 5
      puts " Would you like to play again? (yes/no)"
      choice = gets.chomp.downcase
      if choice == "yes" && choice == "y"
        pull
      else
        menu
      end

    elsif @slot_2 == @slot_3
      puts " You Win!/n $5.00 will be added to your Wallet."
      @player.wallet.amount += 5
      puts " Would you like to play again? (yes/no)"
      choice = gets.chomp.downcase
        if choice == "yes" && choice == "y"
          pull
        else
          menu
        end

    else
      puts "You Lose $1.00"
      @player.wallet.amount -= 1
      puts " Would you like to play again? (yes/no)"
      choice = gets.chomp.downcase
      if choice == "yes" && choice == "y"
        pull
      else
        menu
      end
    end
  end
end


menu



# puts " your roll #{slot_1},#{slot_2}, and #{slot_3}."
# puts " your winnings are"

# if @slot_1 = 1 and @slot_2 = 1 and slot_3 = 1
# Nested if statements.
#  if slot1 = slot2

# if slot2 = slot 3
# award (something) points

# else if slot2 = slot3
# awards 5 points.

# score = score + 10 points

# else
# puts "nothing"
