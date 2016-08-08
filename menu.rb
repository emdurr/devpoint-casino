require 'pry'
require_relative 'craps.rb'

class GameMenu
  attr_accessor :wallet, :game_arr
  def initialize(wallet)
    puts "Welcome to your Casino Game menu!"
    @wallet = wallet
    @game_arr = ['Slots', 'Hi Lo', 'Black-Jack', 'Craps']
    menu
  end

  def menu
    puts "What game would you like to play?"
    counter = 1
    @game_arr.each do |game|
      puts "#{counter}: #{game}"
      counter += 1
    end
    print "-->"
    user_input = gets.to_i
    @game_to_play = @game_arr[user_input - 1]
    if @game_to_play == 'Slots'
      @slots = Slots.new
      @slots.first_bet(@wallet)
    elsif @game_to_play == 'Craps'
      @craps = Craps.new
      @craps.first_bet(@wallet)
    elsif @game_to_play == 'Hi Lo'
      @hi_lo = HighLow.new
      @hi_lo.first_bet(@wallet)
    else
      puts "Not a valid game selection. Please try again."
      menu
    end
  end


end

