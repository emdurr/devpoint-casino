require_relative 'player.rb'
require_relative 'wallet.rb'
require_relative 'high_low.rb'
require_relative 'menu.rb'

U

class Casino
  attr_accessor :player, :wallet, :menu

  def initialize
    puts "Welcome to the Casino!"

    # for now 1 player
    # we should be able to add as many players
    # we should be able to switch between players
    # get it to work with one player and go from there
    @player = Player.new
    @wallet = Wallet.new(@user_name)
    @menu = Menu.new(@wallet)
  end
end

Casino.new
