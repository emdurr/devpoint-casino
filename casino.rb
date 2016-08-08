require_relative 'player.rb'

class Casino
  attr_accessor :player

  def initialize
    puts "Welcome to the Casino!"
    # for now 1 player
    # we should be able to add as many players
    # we should be able to switch between players
    # get it to work with one player and go from there
    @player = Player.new
  end
end

Casino.new
