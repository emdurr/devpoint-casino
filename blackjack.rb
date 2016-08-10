require 'pry'
require_relative 'deck_cards.rb'
require_relative 'wallet.rb'

class BlackJack
  attr_accessor :player, :game
  def initialize(player, game)
    @game = game
    @player = player
    @game = game
    puts 'Welcome to BlackJack!'
    puts 'Type Q to leave the Table or S to start WINNING!.'
    input = gets.strip.downcase
    if input == 'q'
      @game.menu
    else
      dealer_hand
    end
  end

  def dealer_hand
    @deck = Deck.new
    @dealer_first_card = @deck.return_a_card
    @dealer_second_card = @deck.return_a_card
    puts "Dealer's starting hand is \n#{@dealer_first_card.find_rank} of #{@dealer_first_card.suit} "
    puts "Card upside down."
    player_hand
  end

  def player_hand
    @player_first_card = @deck.return_a_card
    @player_second_card = @deck.return_a_card
    puts "Your hand is.."
    puts "#{@player_first_card.find_rank} of #{@player_first_card.suit}"
    puts "#{@player_second_card.find_rank} of #{@player_second_card.suit}"
    bet_placement
  end
  def bet_placement
    puts "How much would you like to bet of your #{@player.wallet.amount} amount?"
    @bet_amount = gets.to_i
    option
  end

  def option
    @player_third_card = @deck.return_a_card
    puts '(H)it'
    puts '(S)tay'
    option_input = gets.strip
    # case option_input
      if option_input == 'H'
        puts "Card is \n#{@player_third_card.find_rank} of #{@player_third_card.suit}"
        option
      else 'S'
        dealer_option
    end
  end

  def dealer_option
    puts "Second card is \n#{@dealer_second_card.find_rank} of #{@dealer_second_card.suit}"
    if @dealer_first_card.value + @dealer_second_card.value <= 16
      dealer_last
    elsif @dealer_first_card.value + @dealer_second_card.value >= 17 || @dealer_first_card.value + @dealer_second_card.value == 21
      pick_winner
    elsif @dealer_first_card.value + @dealer_second_card.value >= 16
      # do something
    else
    end
  end

  def dealer_last
    @dealer_third_card = @deck.return_a_card
    puts "#{@dealer_third_card.find_rank} of #{@dealer_third_card.suit}"
    # if @dealer_first_card.value + @dealer_second_card.value + @dealer_third_card.value <= 21
    #   puts "Dealer Won!"
    # end
    pick_winner
  end

  def pick_winner
  end
end
