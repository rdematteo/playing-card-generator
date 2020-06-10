# frozen_string_literal: true

# creates a Deck class
class Deck
  SUITS = ['♠︎', '❤️', '♦︎', '♣︎'].freeze
  VALUES = (2..10).map(&:to_s) + %w[J Q K A]

  def initialize
    @stack = generate_stack
  end

  def draw
    @stack.pop
  end

  def shuffle
    @stack.shuffle!
  end

  private # cannot be called with a specific receiver

  def generate_stack
    VALUES.product(SUITS).map!(&:join)

    # stack = []
    # VALUES.each do |value|
    #   SUITS.each do |suit|
    #     stack << value + suit
    #   end
    # end
    # stack
  end
end

class Player
  def initialize
    @hand = []
  end

  def draw(card)
    @hand << card
  end

  def peek_at_hand(_player)
    reveal_hand
  end

  private

  def reveal_hand
    puts @hand
  end
end

class Dealer
  def initialize
    @deck = Deck.new
    @name = 'Tommy'
  end

  def deal_card(player)
    player.draw(@deck.draw) # draw(card) card = @deck.draw method from Player class;  @deck.draw from Deck class
  end

  def shuffle_deck
    @deck.shuffle
  end

  def burn_card
    @deck.draw
  end

  def open_pack
    @deck = Deck.new
  end

  def show_deck
    p @deck
  end

  # def bad_method
  #   @deck.generate_stack
  # end
end

# p Deck::VALUES
# deck = Deck.new
# p deck
dealer = Dealer.new
p dealer
dealer.show_deck
p dealer.shuffle_deck

dealer = Dealer.new
tara = Player.new
p dealer
p dealer.shuffle_deck
dealer.burn_card
5.times { dealer.deal_card(tara) }

p dealer
p tara
# p dealer.bad_method

tara.peek_at_hand(tara)
