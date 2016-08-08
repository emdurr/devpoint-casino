class Card
  attr_accessor :rank, :suit, :color
  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end

  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        color =(i % 2 == 0) ? 'Black' : 'Red'
        @cards << Card.new(@ranks[i], suit, color)
      end
    end
  end
end

new_card = Deck.new

puts "#{new_card.cards.sample.color} #{new_card.cards.sample.rank} of #{new_card.cards.sample.suit}"