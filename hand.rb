
require_relative 'deck'
require_relative 'card'
class Hand

  attr_accessor :cards
  def initialize(cards)
    @cards = cards
    # @cards = cards.deal(1)
  end

  def hand_total
    score = 0
    ace = 0
    @cards.each do |card|
      if card.face_card?
        score += 10
      elsif card.ace?
        ace += 11
        if ace + score >= 21
          ace += 1
          score += ace
        end
      else
        score += ace
        score += card.rank.to_i
      end
    end
    score
  end

  def to_s
    if cards.length > 2
      "#{cards.last}"
    else
      cards.map { |card| "#{card.rank}#{card.suit}" }.join(" ")
    end
  end
end


# deck = Deck.new
# cards = deck.deal(2)
# hand = Hand.new(cards)
# puts hand.to_s
# puts hand.hand_total
