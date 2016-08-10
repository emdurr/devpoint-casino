require 'pry'
require_relative 'craps.rb'
require_relative 'high_low.rb'
require_relative 'slots_casino.rb'
require_relative 'lucky_player1'
require_relative 'blackjack.rb'


class GameMenu
  attr_accessor :game_arr, :player, :games_played
  def initialize(player)
    @player = player
    puts "Welcome to your Casino Game menu!"
    @game_arr = ['Slots', 'Hi Lo', 'Craps']
    @games_played = 0
    @lucky = Lucky1.new(@player)
    menu
  end

  def menu
    puts "What game would you like to play?"
    puts "Type 'Q' to leave the Casino"
    counter = 1
    @game_arr.each do |game|
      puts "#{counter}: #{game}"
      counter += 1
    end
    print "-->"
    user_input = gets.strip.downcase
    if user_input == 'q'
      exit
    else
      game_selection = user_input.to_i
    end
    @game_to_play = @game_arr[game_selection - 1]
    if @game_to_play == 'Slots'
      check_lucky_code
      @slots = SlotsCasino.new(@player, self)
      @slots.menu
    elsif @game_to_play == 'Craps'
      check_lucky_code
      @craps = Craps.new(@player, self)
      @craps.bet_amount
    elsif @game_to_play == 'Hi Lo'
      check_lucky_code
      @hi_lo = HighLow.new(@player, self)
      @hi_lo.first_bet
    elsif @game_to_play == 'Black-Jack'
      check_lucky_code
      @blackjack = BlackJack.new(@player, self)
      @blackjack.dealer_hand
    else
      puts "Not a valid game selection. Please try again."
      menu
    end
  end

  def check_lucky_code
    @lucky.luck if @games_played == 1
    @games_played += 1
  end


end
