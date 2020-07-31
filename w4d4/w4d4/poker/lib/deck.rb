require_relative "card"
class Deck
    VALUES = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A 
    ]
    attr_reader :card, :array
    def initialize
        @card = card
        @deck = []
    end

end