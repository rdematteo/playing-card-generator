
class Deck
  SUITS = ['s', 'h', 'd', 'c']
  VALUES = (2..10).map(&:to_s) + ['J', 'Q', 'K', 'A']

  def initialize
    @stack = generate_stack
  end

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

  def draw 
    @stack.pop
  end

  def shuffle 
    @stack.shuffle!
  end


end


class Player
  
end


class Dealer
  
end

p Deck::VALUES
deck = Deck.new
p deck
