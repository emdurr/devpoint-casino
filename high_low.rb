require 'pry'
require_relative 'deck_cards.rb'
# a card needs to be drawn from an array
class HighLow
  attr_accessor
  def initialize
    puts 'Welcome to High Low'
    first_bet
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
    first_card = @deck.return_a_card
    second_card = @deck.return_a_card
    puts first_card.find_rank
    # binding.pry
    compare_method(first_card, second_card)
  end

  def compare_method(first, second)
    puts "Is the next card going to be High or Low?"
    choice = gets.strip.downcase
    puts 'What would like to bet?'
    bet_amount = gets.to_i

    case choice
      when 'high'
        high(first, second)
      when 'low'
        low(first, second)
      else
        puts 'Please make a valid selection'
    end
  end

  def high(first, second)
    first_card = first.value
    second_card = second.value
    if first_card < second_card
      puts "You Win!!"
    else
      puts "You Loose!" 
    end
  end

  def low(first, second)
    first_card = first.value
    second_card = second.value
    if first_card > second_card
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