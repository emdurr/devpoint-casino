# require_relative 'player.rb'
# require-relative 'menu.rb'

slots = ['A', 'J', '7']

# is there a way to get one array to repeat and spit out 3 numbers?
# hash that associates the number with a symbol  (bonus)

def menu
  puts "Welcome to Slots! Press any number to continue. Press Q to quit the game."
  input = gets.chomp.downcase
    if "Q"
    exit
    else "0..9"
    pull
    # elsif (letters)
    puts "Please try another entry."
    end
end
def pull
  puts "Ready?\n Let's play.\n Press any key to play."
  lever = gets.chomp
exit
end

 menu
 pull

# puts " your roll #{slot_1},#{slot_2}, and #{slot_3}."
# puts " your winnings are"

# if slot_1 = 1 and slot_2 = 1 and slot_3 = 1
# Nested if statements.
#  if slot1 = slot2

# if slot2 = slot 3
# award (something) points

# else if slot2 = slot3
# awards 5 points.

# score = score + 10 points

# else
# puts "nothing"
