class Menu
  def initialize
    puts "Welcome to your Casino Game menu!"
    @game_arr = ['Slots', 'Hi/Lo', 'Black-Jack', 'Craps']
    menu
  end

  def menu
    puts "What game would you like to play?"
    counter = 1
    @game_arr.each do |game|
      puts "#{counter}: #{game}"
      counter += 1
    end
    print "-->"
    user_input = gets.to_i
    @game_to_play = @game_arr[user_input - 1]
  end


end
