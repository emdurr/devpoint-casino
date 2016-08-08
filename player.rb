require_relative 'wallet.rb'
class Player
  attr_accessor :wallet
  # make sure to add attr_accessor
  def initialize
    puts "Create a new player"
    get_name

    # setup instance variables
    #by getting user input
    # like name, age, wallet amount
    # Should the wallet be its own class?
  end
  def get_name
    puts "What is your name?"
    user_input = gets.chomp.upcase
    puts "Thank you, #{user_input}!"
    @user_name = user_input
    age
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
