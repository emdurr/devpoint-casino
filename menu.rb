require 'pry'
require_relative 'craps.rb'
require_relative 'high_low.rb'
require_relative 'slots_casino.rb'

class GameMenu
  attr_accessor :game_arr, :player
  def initialize(player)
    @player = player
    puts "Welcome to your Casino Game menu!"
    @game_arr = ['Slots', 'Hi Lo', 'Black-Jack', 'Craps']
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
      @slots = SlotsCasino.new(@player)
      @slots.menu
    elsif @game_to_play == 'Craps'
      @craps = Craps.new(@player)
      @craps.first_bet
    elsif @game_to_play == 'Hi Lo'
      @hi_lo = HighLow.new(@player)
      @hi_lo.first_bet
    else
      puts "Not a valid game selection. Please try again."
      menu
    end
  end


end
