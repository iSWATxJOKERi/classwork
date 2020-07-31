require "rspec"
require "tower"

# first = [1, 2, 3]
# move = first.shift
# middle << move
# middle = [] if middle[-1] > move 
# last = []


describe "#initialize" do
    subject(:towers) {Towers.new}
    it 'set a 2d-arr of 3 arrays' do
        expect(towers.length).to eq 3
    end



end