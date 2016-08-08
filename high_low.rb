require 'pry'
require_relative 'deck_cards.rb'
# a card needs to be drawn from an array
class HighLow
  attr_accessor
  def initialize
    puts 'Welcome to High Low'
    puts 'Type Quit at anytime to leave the game.'
    start_game
  end

  def start_game
    puts 'Your first card is...'
    @deck = Deck.new
    # puts @deck
    # require_relative 'deck_cards.rb'
    first_card = @deck.return_a_card
    second_card = @deck.return_a_card
    puts first_card.find_rank
    # binding.pry
    compare_method(first_card, second_card)
  end

  def compare_method(first, second)
    binding.pry
    puts "high or low"
    choice = gets.strip
    puts "#{first}, #{second}"
  end
end

HighLow.new


# grab userinput and store it 
# drawn a new a card, 
# compare user choice, weather right or wrong
# let user know if won/lost and update account balance
# give option to continue or quit