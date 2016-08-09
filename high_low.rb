require 'pry'
require_relative 'deck_cards.rb'
# a card needs to be drawn from an array
class HighLow
  attr_accessor :player
  def initialize(player)
    @player = player
    puts 'Welcome to High Low'
    puts 'Type Q if you would like to leave the game.'
    quit = gets.strip.downcase
    if quit == 'q'
      GameMenu.new(@player)
    else
      first_bet
    end
    
  end

  def first_bet
    puts "What would you like your bet amount to be?"
    bet_amount = gets.to_i
    start_game
  end

  def start_game
    puts 'Your first card is...'
    @deck = Deck.new
    # puts @deck
    # require_relative 'deck_cards.rb'
    @first_card = @deck.return_a_card
    @second_card = @deck.return_a_card
    puts @first_card.find_rank
    # binding.pry
    compare_method
  end

  def compare_method
    puts "Is the next card going to be High or Low?"
    choice = gets.strip.downcase
    
    case choice
      when 'high'
        high
      when 'low'
        low
      else
        puts 'Please make a valid selection'
    end
  end

  def high
    @first_card = first.value
    @second_card = second.value
    if @first_card < @second_card
      puts "You Win!!"
    else
      puts "You Loose!" 
    end
  end

  def low(first, second)
    @first_card = first.value
    @second_card = second.value
    if @first_card > @second_card
      puts "You Win!!"
    else
      puts "You Loose!"
    end
  end
end




# grab userinput and store it 
# drawn a new a card, 
# compare user choice, weather right or wrong
# let user know if won/lost and update account balance
# give option to continue or quit