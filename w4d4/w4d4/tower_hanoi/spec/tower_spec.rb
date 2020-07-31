require "rspec"
require "tower"

# first = [1, 2, 3]
# move = first.shift
# middle << move
# middle = [] if middle[-1] > move 
# last = []


describe "#initialize" do
    subject(:game) {Towers.new}
    it 'set a variable tower to a 2d-array of 3 arrays' do
        expect(game.towers.length).to eq 3
    end
    # it 'Each tower should have a length of 3' do
    #     expect(game.towers[0].length).to eq 3
    #     expect(game.towers[1].length).to eq 3
    #     expect(game.towers[2].length).to eq 3
    # end

    it 'tower should call Towers#setup_discs' do
        expect(game).to receive(:setup_discs)
        game.setup_discs
    end
end

describe "#setup_discs" do
    subject(:game) {Towers.new}
    it 'should set discs in ascending order to the first tower' do
        expect(game.towers[0]).to eq [1, 2, 3]
    end
end

describe "#[]" do
    subject(:game) {Towers.new}
    it 'should take a position as an argument and return the element at that position' do 
        expect(game).to receive(:[])
        game[0]
    end
end

describe "#move" do
    let(:game) {Towers.new}
    it 'should take in two integer arguments, pile and end pile.' do
        # expect(game.move(0)).to raise_error("need an end pile")
        # expect(game.move(0, 'five')).to raise_error("has to be two integers")
    end
    it 'should retrieve the first item from the users selected pile(array)' do
        expect(game.towers[0]).to receive(:shift)
        game.towers[0].shift
    end
    it 'should add disc value to the end pile selected by user' do
        game.move(0,2)
        disc = game.towers[0].shift
        game.towers[2].unshift(disc)
        expect(game.towers[2][0]).to eq(disc)
    end
    
    # first-get selected pile from user
    # remove disc from selected pile
    # add disc to chosen pile 
end