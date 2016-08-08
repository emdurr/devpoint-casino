require_relative 'player.rb'
require_relative 'wallet.rb'
USER_NAME = "blank"
class Casino
  attr_accessor :player, :wallet

  def initialize
    puts "Welcome to the Casino!"

    # for now 1 player
    # we should be able to add as many players
    # we should be able to switch between players
    # get it to work with one player and go from there
    @player = Player.new
    @wallet = Wallet.new(USER_NAME)
  end
end

Casino.new
