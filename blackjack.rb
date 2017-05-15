
require_relative "card"
require_relative "deck"
require_relative "hand"

class Blackjack
  def initialize
    deck = Deck.new
    player_cards = deck.deal(2)
    computer_cards = deck.deal(2)
    @hit_card = deck.deal(1)
    @computer_hit_card = deck.deal(1)

    @player = Hand.new(player_cards)
    @computer = Hand.new(computer_cards)
  end

  def player_message
    player_message = ""
    player_message += "Player was dealt #{@player.to_s[0..1]}\n"
    player_message += "Player was dealt #{@player.to_s[2..-1]}\n"
    player_message
  end

  def computer_message
    @computer_score = @computer.hand_total
    new_hand = Hand.new(@computer_hit_card)
    computer_message = ""
    computer_message += "Computer was dealt #{@computer.to_s[0..1]}\n"
    computer_message += "Computer was dealt #{@computer.to_s[2..-1]}\n"
    if @computer_score > 17
      computer_message += "Computer score: #{@computer_score}\n"
      computer_message += "Computer stands.\nYou win!"
    else
      @computer_score += (new_hand.hand_total + @computer_score)
      computer_message += "Computer score: #{@computer_score}\n Bust! You win!"
    end
    computer_message
  end

  def hit_stand
    new_score = 0
    @total_with_hits = 0
    message = ""
    puts "#{player_message}"
    puts "Players score: #{@player.hand_total}\n"
    puts "\nHit or stand (H/S)\n"
    user_prompt = gets.chomp

    # require 'pry'
    while user_prompt == "h"
      new_hand = Hand.new(@hit_card)
      new_score += (new_hand.hand_total + @player.hand_total )
      puts "Player was dealt #{new_hand}\nPlayer score: #{new_score}"
      puts "Hit or stand (H/S)"
      user_prompt = gets.chomp
    end

    if user_prompt == "s" && @total_with_hits == new_score
      @total_with_hits += @player.hand_total
      message << "Player score: #{@total_with_hits}\n"
      message << "#{computer_message}"
    else
      @total_with_hits += new_score

      if @total_with_hits > 21
        message << "Player score: #{@total_with_hits}\nBust! Game over..."
      else
        message << "Player score: #{@total_with_hits}\n"
        message << "#{computer_message}\n"
      end
    end
    message
    #  binding.pry
  end
end

message = Blackjack.new
computer_print = Blackjack.new
print "Welcome to Blackjack!\n"
puts
puts message.hit_stand
