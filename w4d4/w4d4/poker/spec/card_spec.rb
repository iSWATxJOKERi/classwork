require "card"

describe "#initialize" do
    subject(:card) { Card.new("Heart", "Red", 10) }
    
    it 'takes in and sets 3 attributes: suit, color, value' do
        expect(card.suit).to eq "Heart"
        expect(card.color).to eq "Red"
        expect(card.value).to eq 10
    end
end