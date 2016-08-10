require_relative 'wallet.rb'
require 'pry'
class Player
  attr_accessor :user_name, :wallet
  # make sure to add attr_accessor
  def initialize
    # @multi_player = []
    puts "Create a new player"
    @user_name = get_name
    age
    @wallet = Wallet.new

  end

  # def more_players
  #   puts "How many players will be playing today?"
  #   @user_input_1 = gets.to_i
  #   get_name
  # end

  def get_name
    # number_to_add = @user_input_1
    # number_to_add.times do
      puts "What is your name?"
      user_input = gets.chomp.upcase
      puts "Thank you, #{user_input}!"

      # @multi_player << user_input
    # end
     user_input
  end
  def age
    puts "What is your age?"
    user_input_1 = gets.to_i
    if user_input_1 >= 21
      puts "Let's play!"
      #@wallet = Wallet.new(user_input)
    else
      puts "You're too young to play!"
      puts "Come back when you're older!"
      exit
    end
  end

end
