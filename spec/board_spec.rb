require 'RSpec'
require './lib/ship'
require './lib/cell'
require './lib/board'

	RSpec.describe do
		cells = {
			"A1" => Cell.new("A1"),
			"A2" => Cell.new("A2"),
			"A3" => Cell.new("A3"),
			"A4" => Cell.new("A4"),
			"B1" => Cell.new("B1"),
			"B2" => Cell.new("B2"),
			"B3" => Cell.new("B3"),
			"B4" => Cell.new("B4"),
			"C1" => Cell.new("C1"),
			"C2" => Cell.new("C2"),
			"C3" => Cell.new("C3"),
			"C4" => Cell.new("C4"),
			"D1" => Cell.new("D1"),
			"D2" => Cell.new("D2"),
			"D3" => Cell.new("D3"),
			"D4" => Cell.new("D4")
		}
	let(:board) {Board.new(cells)}
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
end

	# xit "places a ship"
	# board.place(cruiser, ["A1", "A2", "A3"])
	# expect(cell_1 = board.cells["A1"]).to eq()
	# expect(cell_2 = board.cells["A2"]).to eq()
	# expect(cell_3 = board.cells["A3"]).to eq()
	# end


