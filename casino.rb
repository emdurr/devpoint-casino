require_relative 'player.rb'
require_relative 'menu.rb'

class Casino
  def initialize
    puts "Welcome to the Casino!"
    get_player
    menu
  end
  def get_player
    @player = Player.new
  end
  def menu
    GameMenu.new(@player)
  end
  def self.new_game
    GameMenu.new(@player)
  end
end
Casino.new
