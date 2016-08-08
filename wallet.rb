class Wallet
  def initialize(player_name)
    @player_name = player_name
    puts "Your starting wallet total."
  end

  def gets_wallet_total
    puts "How much will you be starting with today #{@player_name}?"
  end
end
