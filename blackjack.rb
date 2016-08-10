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
    option_input = gets.strip.upcase
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
    dealer_total = @dealer_first_card.value + @dealer_second_card.value
    case dealer_total
    when 1..16
        # deal <= 16
        # dealer auto gets new card
      dealer_last
    when 21
      #dealer auto win
      pick_winner
    when 17..20
      pick_winner
    # elsif @dealer_first_card.value + @dealer_second_card.value >= 17 || @dealer_first_card.value + @dealer_second_card.value == 21
    #   pick_winner
    # elsif @dealer_first_card.value + @dealer_second_card.value >= 16
    #   # do something
    else
      puts "Dealer Bust!"
      # player auto win
      pick_winner
    end
  end

  def dealer_last
    @dealer_third_card = @deck.return_a_card
    puts "#{@dealer_third_card.find_rank} of #{@dealer_third_card.suit}"
    # if @dealer_first_card.value + @dealer_second_card.value + @dealer_third_card.value <= 21
    #   puts "Dealer Won!"
    # end
    dealer_total = @dealer_first_card.value + @dealer_second_card.value + @dealer_third_card.value
    puts "Dealer Bust" if dealer_total > 21
    again
    
  end

  def pick_winner
    puts "Here we pick the winner."

    again
  end

  def again
    puts "Would you like to play again? y/n"
    user_input = gets.strip.downcase
    if user_input == 'y'
      puts "Deal!"
      dealer_hand
    else
      @game.menu
    end
  end
end
