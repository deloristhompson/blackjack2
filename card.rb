# require_relative 'hand'

class Card
  # Your code here
  attr_accessor :rank, :suit, :ace
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    facecards = ['J', 'Q', 'K']
    facecards.include?(@rank)
  end

  def ace?
    ace = ['A']
    ace.include?(@rank)
  end
end

# cards = Card.new('A', '♠')
#
# puts cards.ace?
