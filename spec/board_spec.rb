require 'RSpec'
require './lib/ship'
require './lib/cell'
require './lib/board'

	RSpec.describe do
		
	let(:board) {Board.new}
	let(:cruiser) {Ship.new("Cruiser", 3)}
	let(:submarine) {Ship.new("Submarine", 2)}
	

	xit "initializes" do
    	expect(board).to be_an_instance_of(Board)
    	expect(board.cells).to eq(cells)
	end

	it "validates coordinates" do
		expect(board.valid_coordinate?("A1")).to eq(true)
		expect(board.valid_coordinate?("D4")).to eq(true)
		expect(board.valid_coordinate?("A5")).to eq(false)
		expect(board.valid_coordinate?("E1")).to eq(false)
		expect(board.valid_coordinate?("A22")).to eq(false)
	end

	it "validates placements" do
		expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
		expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
		expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
		expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
		expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
		expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
		expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
		expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
		expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
		expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
		expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
	end

	it "places a ship" do
		board.place(cruiser, ["A1", "A2", "A3"])
		cell_1 = board.cells["A1"]
		cell_2 = board.cells["A2"]
		cell_3 = board.cells["A3"]
		require 'pry'; binding.pry

		expect(cell_1.ship).to eq(cruiser)
		expect(cell_2.ship).to eq(cruiser)
		expect(cell_3.ship).to eq(cruiser)
	end
end


