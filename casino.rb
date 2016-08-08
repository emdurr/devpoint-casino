require_relative 'player.rb'
require_relative 'wallet.rb'
require_relative 'high_low.rb'
require_relative 'menu.rb'

<<<<<<< e079bfca630c4361a110e9372a90a68ea7c13d65
=======
U

>>>>>>> trying to sync up
class Casino
  attr_accessor :player, :wallet, :menu

  def initialize
    puts "Welcome to the Casino!"

    # for now 1 player
    # we should be able to add as many players
    # we should be able to switch between players
    # get it to work with one player and go from there
    @player = Player.new
    @wallet = Wallet.new(@player)
    @game_menu = GameMenu.new(@wallet)
  end
end

Casino.new
