require "rspec"
require "tdd_project"



describe "my_uniq" do
    it 'should take an array and return new array' do
        a1 = [1,2,1,3,3]
        expect(my_uniq(a1)).to eq([1,2,3])
    end
end

describe "#two_sum" do
    a1 = [-1,0,2,-2,1]
    it "find all pairs of positions where sum is equal to 0" do
        expect(a1[0] + a1[4]).to eq(0)
    end
    it "returns an array of proper index pairs" do
        expect(a1.two_sum).to eq([[0,4],[2,3]])
    end
end

describe "#my_transpose" do
    rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
    ]

    row1 = rows[0]
    row2 = rows[1]
    row3 = rows[2]

    cols = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
    ]

    col1 = cols[0]
    col2= cols[1]
    col3= cols[2]

    it 'returns a transposed array' do
        expect(my_transpose(rows)).to eq(cols)
    end
    it 'rows are coloumns and the columns are rows' do
        expect(my_transpose(rows)[0]).to eq(col1)
        expect(my_transpose(rows)[1]).to eq(col2)
        expect(my_transpose(rows)[2]).to eq(col3)
    end
end

describe '#stock_picker' do
    stock_prices = [10, 30, 20, 100, 80, 50]
    it 'returns an array of a pair' do 
        expect(stock_picker(stock_prices).length).to eq 2
    end
    it 'returns a higher pair value' do
        expect(stock_picker(stock_prices)).to eq [0, 3]
    end
end