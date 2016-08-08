require_relative 'player.rb'
require_relative 'wallet.rb'
require_relative 'high_low.rb'
require_relative 'menu.rb'

class Casino
  def initialize
    puts "Welcome to the Casino!"
    get_player
    # for now 1 player
    # we should be able to add as many players
    # we should be able to switch between players
    # get it to work with one player and go from there
    menu
  end
  def get_player
    @player = Player.new
  end
  def menu
    game = GameMenu.new(@player)
  end
end
Casino.new
