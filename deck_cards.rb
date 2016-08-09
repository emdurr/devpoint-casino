require 'pry'
class Card
  attr_accessor :rank, :suit, :color, :value
  def initialize(rank, suit, color, value)
    @rank = rank
    @suit = suit
    @color = color
    @value = value.to_i
  end

  def color
    return @color
  end

  def find_rank
    return @rank
  end

  def value
    return @value
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @values = %w(14 2 3 4 5 6 7 8 9 10 11 12 13)
    @cards = []
    generate_deck
  end

  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        color = (suit == "Spades" || suit == "Clubs") ? 'Black' : 'Red'
        @cards << Card.new(@ranks[i], suit, color, @values[i])
      end
    end
  end

  def return_cards
    return @cards
  end

  def return_a_card
    return @cards.sample
  end
end

new_card = Deck.new

new_card = "#{new_card.cards.sample.color} #{new_card.cards.sample.rank} of #{new_card.cards.sample.suit}"
