require_relative 'dice_roll.rb'
require 'colorize'
class Craps
  attr_accessor :player, :game
  def initialize(player, game)
    @game = game
    puts "Welcome to the Craps table!!"
    image = """ .........                                  .
              :~, *   * ~,                    .
              : ~, *   * ~.                   .
              :  ~........~                   .
              : *:         :      ~'~,        .
              :  :         :    ~' *  ~,      .
              ~* :    *    : ,~' *    * ~,    .
               ~,:         :.~,*    *  ,~ :   .
                ~:.........::  ~, *  ,~   :   .
                            : *  ~,,~  *  :   .
                            :* * * :  *   :   .
                             ~, *  : *  ,~    .
                               ~,  :  ,~      .
                                 ~,:,~        ."""
    puts image.white.on_red.blink
    @dice_roll = Dice.new
    @player = player
    @available_bets = ['Pass Line', "Don't Pass Line",
                       'Place Bet 4', 'Place Bet 5', 'Place Bet 6', 'Place Bet 8', 'Place Bet 9', 'Place Bet 10',
                       'Place Bet to Lose 4', 'Place Bet to Lose 5', 'Place Bet to Lose 6', 'Place Bet to Lose 8', 'Place Bet to Lose 9', 'Place Bet to Lose 10',
                       'Buy Bet 4', 'Buy Bet 5', 'Buy Bet 6', 'Buy Bet 8', 'Buy Bet 9', 'Buy Bet 10',
                       'Lay Bet 4', 'Lay Bet 5', 'Lay Bet 6', 'Lay Bet 8', 'Lay Bet 9', 'Lay Bet 10',
                       'Field', 'Any 7', 'Any Craps', 'Snake Eyes', 'Twelve Craps',
                       'Three Craps', 'Six Five',
                       'Horn Bet']
    @counter = 1
    @dice_options = [{'total' => 2, 'saying' => 'Aces!'},
                     {'total' => 3, 'saying' => 'Ace deuce!'},
                     {'total' => 4, 'saying' => 'Four!'},
                     {'total' => 5, 'saying' => 'Fever!'},
                     {'total' => 6, 'saying' => 'She-hix!'},
                     {'total' => 7, 'saying' => 'Seven!'},
                     {'total' => 8, 'saying' => 'Eight!'},
                     {'total' => 9, 'saying' => 'Centerfield nine!'},
                     {'total' => 10, 'saying' => 'Tennessee!'},
                     {'total' => 11, 'saying' => 'Yo-leven!'},
                     {'total' => 12, 'saying' => 'Full Boat!'}
                    ]
    @bet_placement = []
    @bet_placement_1 = []
    @bet_placement_2 = []
    @bet_total = []
  end

  def clear_bets
    @bet_placement.clear
  end

  def first_bet
    puts "Choose a bet to place:"
    puts "Type 'Q' if you would like to leave Craps."
    @available_bets.each do |el|
      puts "#{@counter}: #{el}"
      @counter += 1
    end
    @counter = 1
    user_input = gets.strip.downcase
    if user_input == 'q'
      @game.menu
      #Casino.new_game
    else
      game_to_play = user_input.to_i
    end
    @bet_placement << @available_bets[game_to_play - 1]
    puts "You are betting on #{@bet_placement.join(" ")} #{@bet_placement_1.join(" ")} #{@bet_placement_2.join(" ")}"
    another_bet
  end

  def bet_amount
    puts "How much will you be betting of your #{@player.wallet.amount} amount per bet?"
    puts "Enter 'q' to go back to the game menu"
    user_input_1 = gets.strip.downcase
    if user_input_1 == 'q'
      @game.menu
    else
      wager = user_input_1.to_i
    end
    puts "All bets will be final. Are you sure you want set your bet amount at #{wager}? y/n"
    user_input_2 = gets.strip.downcase
    if user_input_2 == 'y'
      puts "Bet amount accepted!"
      @bet_total << wager
      first_bet
    elsif user_input_2 == 'n'
      puts "Bet refused!"
      bet_amount
    else
      puts "Invalid selection. Please try again."
      bet_amount
    end
  end

  def another_bet
    puts "Would you like to place another bet? y/n"
    user_input_3 = gets.strip.downcase
    if user_input_3 == 'y'
      puts "Perfect!"
      first_bet
    elsif user_input_3 == 'n'
      roll_dice
    else
      puts "Invalid selection. Please try again."
      another_bet
    end
  end

  def roll_dice
    puts "The dice are out!"
    puts
    puts " **** Rolling ****"
    puts
    roll_the_dice = Dice.new
    roll_the_dice.roll
    puts roll_the_dice.show_dice
    @total = roll_the_dice.sum_total
    puts "#{@dice_options[@total - 2]['saying']}"
    puts
    bet_resolution
  end

  def bet_resolution
    (@bet_placement << @bet_placement_1 << @bet_placement_2).flatten!
    @bet_placement.each do |check|
      case @total
      when 7
        if check == 'Pass Line'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == "Don't Pass Line"
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet 4'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet 5'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet 6'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet 8'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet 9'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet 10'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet to Lose 4'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 2.2 * @bet_total[0]
        elsif check == 'Place Bet to Lose 5'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 1.6 * @bet_total[0]
        elsif check == 'Place Bet to Lose 6'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 1.25 * @bet_total[0]
        elsif check == 'Place Bet to Lose 8'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 1.25 * @bet_total[0]
        elsif check == 'Place Bet to Lose 9'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 1.6 * @bet_total[0]
        elsif check == 'Place Bet to Lose 10'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 2.2 * @bet_total[0]
        elsif check == 'Buy Bet 4'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Buy Bet 5'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Buy Bet 6'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Buy Bet 8'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Buy Bet 9'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Buy Bet 10'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Lay Bet 4'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 2 * @bet_total[0]
        elsif check == 'Lay Bet 5'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 1.5 * @bet_total[0]
        elsif check == 'Lay Bet 6'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 1.2 * @bet_total[0]
        elsif check == 'Lay Bet 8'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 1.2 * @bet_total[0]
        elsif check == 'Lay Bet 9'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 1.5 * @bet_total[0]
        elsif check == 'Lay Bet 10'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 2 * @bet_total[0]
        elsif check == 'Field'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Any 7'
          puts "#{check} Winner".white.on_green.blink
          @player.wallet.amount += 4 * @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "#{check} Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        else
          puts
        end
      when 2
        if check == 'Pass Line'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == "Don't Pass Line"
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == 'Place Bet 4'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet to Lose 4'
        elsif check == 'Place Bet to Lose 5'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet to Lose 5'
        elsif check == 'Place Bet to Lose 6'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet to Lose 6'
        elsif check == 'Place Bet to Lose 8'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet to Lose 8'
        elsif check == 'Place Bet to Lose 9'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet to Lose 9'
        elsif check == 'Place Bet to Lose 10'
          puts "Wrong2"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Wrong2"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Wrong2"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Wrong2"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Wrong2"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Wrong2"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Wrong2"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Wrong2"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Wrong2"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Wrong2"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Wrong2"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Wrong2"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Wrong2"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Double-Win"
          @player.wallet.amount += 2 * @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Win"
          @player.wallet.amount += 7 * @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Win"
          @player.wallet.amount += 7.5 * @bet_total[0]
        else
          puts
        end
      when 3
        if check == 'Pass Line'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == "Don't Pass Line"
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == 'Place Bet 4'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet to Lose 4'
        elsif check == 'Place Bet to Lose 5'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet to Lose 5'
        elsif check == 'Place Bet to Lose 6'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet to Lose 6'
        elsif check == 'Place Bet to Lose 8'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet to Lose 8'
        elsif check == 'Place Bet to Lose 9'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet to Lose 9'
        elsif check == 'Place Bet to Lose 10'
          puts "Wrong3"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Wrong3"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Wrong3"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Wrong3"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Wrong3"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Wrong3"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Wrong3"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Wrong3"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Wrong3"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Wrong3"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Wrong3"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Wrong3"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Wrong3"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += 15 * @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += 3.75 * @bet_total[0]
        else
          puts
        end
      when 4
        if check == 'Pass Line'
          puts "Push 4"
          @bet_placement_2 << 'Pass Line'
        elsif check == "Don't Pass Line"
          puts "Push 4"
          @bet_placement_2 << "Don't Pass Line"
        elsif check == 'Place Bet 4'
          puts "Winner if 4"
          @player.wallet.amount += 1.8 * @bet_total[0]
        elsif check == 'Place Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Lose if 4"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet to Lose 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet to Lose 5'
        elsif check == 'Place Bet to Lose 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet to Lose 6'
        elsif check == 'Place Bet to Lose 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet to Lose 8'
        elsif check == 'Place Bet to Lose 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet to Lose 9'
        elsif check == 'Place Bet to Lose 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Winner if 4"
          @player.wallet.amount += 2 * @bet_total[0]
        elsif check == 'Buy Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Lose if 4"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Lay Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        else
          puts
        end
      when 5
        if check == 'Pass Line'
          puts "Push 5"
          @bet_placement_2 << 'Pass Line'
        elsif check == "Don't Pass Line"
          puts "Push 5"
          @bet_placement_2 << "Don't Pass Line"
        elsif check == 'Place Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Winner if 5"
          @player.wallet.amount += 1.4 * @bet_total[0]
        elsif check == 'Place Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet to Lose 4'
        elsif check == 'Place Bet to Lose 5'
          puts "Lose if 5"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet to Lose 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet to Lose 6'
        elsif check == 'Place Bet to Lose 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet to Lose 8'
        elsif check == 'Place Bet to Lose 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet to Lose 9'
        elsif check == 'Place Bet to Lose 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Winner if 5"
          @player.wallet.amount += 1.5 * @bet_total[0]
        elsif check == 'Buy Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Lose if 5"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Lay Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        else
          puts
        end
      when 6
        if check == 'Pass Line'
          puts "Push 6"
          @bet_placement_2 << 'Pass Line'
        elsif check == "Don't Pass Line"
          puts "Push 6"
          @bet_placement_2 << "Don't Pass Line"
        elsif check == 'Place Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Winner if 6"
          @player.wallet.amount += 1.17 * @bet_total[0]
        elsif check == 'Place Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet to Lose 4'
        elsif check == 'Place Bet to Lose 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet to Lose 5'
        elsif check == 'Place Bet to Lose 6'
          puts "Lose if 6"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet to Lose 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet to Lose 8'
        elsif check == 'Place Bet to Lose 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet to Lose 9'
        elsif check == 'Place Bet to Lose 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Winner if 6"
          @player.wallet.amount += 1.2 * @bet_total[0]
        elsif check == 'Buy Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Lose if 6"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Lay Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        else
          puts
        end
      when 8
        if check == 'Pass Line'
          puts "Push 8"
          @bet_placement_2 << 'Pass Line'
        elsif check == "Don't Pass Line"
          puts "Push 8"
          @bet_placement_2 << "Don't Pass Line"
        elsif check == 'Place Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Winner if 8"
          @player.wallet.amount += 1.17 * @bet_total[0]
        elsif check == 'Place Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet to Lose 4'
        elsif check == 'Place Bet to Lose 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet to Lose 5'
        elsif check == 'Place Bet to Lose 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet to Lose 6'
        elsif check == 'Place Bet to Lose 8'
          puts "Lose if 8"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet to Lose 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet to Lose 9'
        elsif check == 'Place Bet to Lose 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Winner if 8"
          @player.wallet.amount += 1.2 * @bet_total[0]
        elsif check == 'Buy Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Lose if 8"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Lay Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        else
          puts
        end
      when 9
        if check == 'Pass Line'
          puts "Push 9"
          @bet_placement_2 << 'Pass Line'
        elsif check == "Don't Pass Line"
          puts "Push 9"
          @bet_placement_2 << "Don't Pass Line"
        elsif check == 'Place Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Winner if 9"
          @player.wallet.amount += 1.4 * @bet_total[0]
        elsif check == 'Place Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet to Lose 4'
        elsif check == 'Place Bet to Lose 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet to Lose 5'
        elsif check == 'Place Bet to Lose 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet to Lose 6'
        elsif check == 'Place Bet to Lose 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet to Lose 8'
        elsif check == 'Place Bet to Lose 9'
          puts "Lose if 9"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet to Lose 10'
          puts "Push to 10"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Winner if 9"
          @player.wallet.amount += 1.5 * @bet_total[0]
        elsif check == 'Buy Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Lose if 9"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Lay Bet 10'
          puts "Push to 10"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        else
          puts
        end
      when 10
        if check == 'Pass Line'
          puts "Push 10"
          @@bet_placement_2 << 'Pass Line'
        elsif check == "Don't Pass Line"
          puts "Push 10"
          @bet_placement_2 << "Don't Pass Line"
        elsif check == 'Place Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Winner if 10"
          @player.wallet.amount += 1.8 * @bet_total[0]
        elsif check == 'Place Bet to Lose 10'
          puts "Lose if 10"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Buy Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Winner if 10"
          @player.wallet.amount += 2 * @bet_total[0]
        elsif check == 'Lay Bet 4'
          puts "Push to 4"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Push to 5"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Push to 6"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Push to 8"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Push to 9"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Lose if 10"
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Field'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        else
          puts
        end
      when 11
        if check == 'Pass Line'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == "Don't Pass Line"
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Place Bet 4'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet to Lose 4'
        elsif check == 'Place Bet to Lose 5'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet to Lose 5'
        elsif check == 'Place Bet to Lose 6'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet to Lose 6'
        elsif check == 'Place Bet to Lose 8'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet to Lose 8'
        elsif check == 'Place Bet to Lose 9'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet to Lose 9'
        elsif check == 'Place Bet to Lose 10'
          puts "Wrong11"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Wrong11"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Wrong11"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Wrong11"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Wrong11"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Wrong11"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Wrong11"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Wrong11"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Wrong11"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Wrong11"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Wrong11"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Wrong11"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Wrong11"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += 15 * @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += 3.75 * @bet_total[0]
        else
          puts
        end
      when 12
        if check == 'Pass Line'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == "Don't Pass Line"
          puts "Winner".white.on_green.blink
          @player.wallet.amount += @bet_total[0]
        elsif check == 'Place Bet 4'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet 4'
        elsif check == 'Place Bet 5'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet 5'
        elsif check == 'Place Bet 6'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet 6'
        elsif check == 'Place Bet 8'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet 8'
        elsif check == 'Place Bet 9'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet 9'
        elsif check == 'Place Bet 10'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet 10'
        elsif check == 'Place Bet to Lose 4'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet to Lose 4'
        elsif check == 'Place Bet to Lose 5'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet to Lose 5'
        elsif check == 'Place Bet to Lose 6'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet to Lose 6'
        elsif check == 'Place Bet to Lose 8'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet to Lose 8'
        elsif check == 'Place Bet to Lose 9'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet to Lose 9'
        elsif check == 'Place Bet to Lose 10'
          puts "Wrong12"
          @bet_placement_1 << 'Place Bet to Lose 10'
        elsif check == 'Buy Bet 4'
          puts "Wrong12"
          @bet_placement_1 << 'Buy Bet 4'
        elsif check == 'Buy Bet 5'
          puts "Wrong12"
          @bet_placement_1 << 'Buy Bet 5'
        elsif check == 'Buy Bet 6'
          puts "Wrong12"
          @bet_placement_1 << 'Buy Bet 6'
        elsif check == 'Buy Bet 8'
          puts "Wrong12"
          @bet_placement_1 << 'Buy Bet 8'
        elsif check == 'Buy Bet 9'
          puts "Wrong12"
          @bet_placement_1 << 'Buy Bet 9'
        elsif check == 'Buy Bet 10'
          puts "Wrong12"
          @bet_placement_1 << 'Buy Bet 10'
        elsif check == 'Lay Bet 4'
          puts "Wrong12"
          @bet_placement_1 << 'Lay Bet 4'
        elsif check == 'Lay Bet 5'
          puts "Wrong12"
          @bet_placement_1 << 'Lay Bet 5'
        elsif check == 'Lay Bet 6'
          puts "Wrong12"
          @bet_placement_1 << 'Lay Bet 6'
        elsif check == 'Lay Bet 8'
          puts "Wrong12"
          @bet_placement_1 << 'Lay Bet 8'
        elsif check == 'Lay Bet 9'
          puts "Wrong12"
          @bet_placement_1 << 'Lay Bet 9'
        elsif check == 'Lay Bet 10'
          puts "Wrong12"
          @bet_placement_1 << 'Lay Bet 10'
        elsif check == 'Field'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += 2 * @bet_total[0]
        elsif check == 'Any 7'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Snake Eyes'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Twelve Craps'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += 30 * @bet_total[0]
        elsif check == 'Three Craps'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Six Five'
          puts "Lose".white.on_red.blink
          @player.wallet.amount -= @bet_total[0]
        elsif check == 'Horn Bet'
          puts "Winner".white.on_green.blink
          @player.wallet.amount += 7.5 * @bet_total[0]
        else
          puts
        end
      else
        puts

      end
    end
    check_wallet
  end

  def check_wallet
    if @player.wallet.amount <= 0
      puts "I'm sorry you do not have enough money to play."
      puts "Come again when you've indebted your soul to a bookie"
      @game.menu
    else
      again
    end
  end

  def again
    puts
    puts "Would you like to go again? y/n"
    user_input_4 = gets.strip.downcase
    if user_input_4 == 'y'
      puts "Would you like to change your bet amount? y/n"
      user_input_5 = gets.strip.downcase
      if user_input_5 == 'y'
        bet_amount
      elsif user_input_5 == 'n'
        puts "Let's do this!"
        @bet_placement.clear
        first_bet
      else
        puts "Invalid selection. Please try again."
        again
      end
    elsif user_input_4 == 'n'
      puts "Would you like to check your wallet amount before leaving? y/n"
      user_input_6 = gets.strip.downcase
      if user_input_6 == 'y'
        puts "Your wallet total is: #{@player.wallet.amount}"
      else
        puts "Thanks for rolling!!"
      end
      puts
      @game.menu
    else
      puts "Invalid selection. Please try again."
      again
    end
  end

end
