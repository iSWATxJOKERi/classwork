require "deck"
require "card"

describe "Deck" do
    it 'creates a contant variable that holds all the face value of cards per suit' do
        expect(Deck.values)
    end
end


describe "#initialize" do

    let(:card) {double("Card")}
    subject(:deck) {Deck.new}
    it 'sets card instance variable' do
        allow(card).to receive(:new)
        expect(deck.card).to eq(card.new)
    end

    it 'sets an array that holds all the card instances of the deck' do
        expect(deck.deck).to eq []
    end
    
end
