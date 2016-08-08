
# a card needs to be drawn from an array
class HighLow
  attr_accessor
  def initialize
    puts 'Welcome to High Low'
    puts 'Type Quit at anytime to leave the game.'
  end
  def first_card
    puts 'Your first card is...'
    puts new_card = Deck.new
    require_relative 'deck_cards.rb'
  end
end


# grab userinput and store it 
# drawn a new a card, 
# compare user choice, weather right or wrong
# let user know if won/lost and update account balance
# give option to continue or quit