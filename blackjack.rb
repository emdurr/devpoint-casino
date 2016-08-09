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
    puts "Dealer's starting hand is #{@dealers_first_card.find_rank} of #{@dealers_first_card.suit} "
    @dealers_first_card = @deck.return_a_card
    @dealsers_second_card = @deck.return_a_card
  end

  def player_hand
    puts "#{@player_first_card.find_rank} of #{@player_first_card.suit}"
    puts "#{@player_second_card.find_rank} of #{@player_second_card.suit}"
    @player_first_card = @deck.return_a_card
    @player_second_card = @deck.return_a_card
  end
end
BlackJack.new(@player)


