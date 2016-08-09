class Lucky1
  attr_accessor :player
  def initialize(player)
    @player = player
  end
  #@player


  def luck
    puts "You trip on a rug and get a concussion. The casino pays for your medical bills plus $1000.00 gets added to your wallet."
    @player.wallet.amount += 1000
  end# end of luck method
end# end of case
