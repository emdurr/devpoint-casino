require 'pry'
require_relative 'deck_cards.rb'

class BlackJack
  attr_accessor :player
  def initialize(player)
    @player = player
    puts 'Welcome to BlackJack!'
    puts 'Type q to leave the Table or S to start WINNING!.'
    input = gets.strip.downcase 
    if input == 'q'
    GameMenu.new(@player) 
    else 
      dealer_hand
    end 
  end

  def dealer_hand
    @deck = Deck.new
    @dealers_first_card = @deck.return_a_card
    @dealers_second_card = @deck.return_a_card
    puts "Dealer's starting hand is \n#{@dealers_first_card.find_rank} of #{@dealers_first_card.suit} "
    puts "Card upside down."
    player_hand
  end

  def player_hand
    @player_first_card = @deck.return_a_card
    @player_second_card = @deck.return_a_card
    puts "Your hand is.."
    puts "#{@player_first_card.find_rank} of #{@player_first_card.suit}"
    puts "#{@player_second_card.find_rank} of #{@player_second_card.suit}"
    option
  end

  def option
    @player_third_card = @deck.return_a_card
    puts '(H)it'
    puts '(S)tay'
    option_input = gets.strip
    case option_input
      when 'H'
        puts "Card is \n#{@player_third_card.find_rank} of #{@player_third_card.suit}"
        option
      else 'S'
        dealer_option
    end
  end

  def dealer_option
    binding.pry
    puts "Second card is \n#{@dealers_second_card.find_rank} of #{@dealers_second_card.suit}"
  end
end
BlackJack.new(@player)


