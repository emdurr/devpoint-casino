class Wallet
  attr_accessor :amount
  def initialize
    @amount = 10000
    puts "Your starting wallet total is $10,000."
    puts "Would you like to change that?"
    change_question
  end

  def change_question
    user_input = gets.strip.downcase
    gets_wallet_total if user_input == 'y'
  end

  def gets_wallet_total
    puts "How much will you be starting with today?"
    user_input_1 = gets.to_f
    puts "Your wallet amount is #{user_input_1}"
    @amount = user_input_1
  end
end
