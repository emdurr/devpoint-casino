require_relative 'player.rb'

class Casino
  # Make sure you use attr_accessor

  def initialize
    puts "Welcome to the Casino!"
    @player = Player.new
  end
end

Casino.new
