require 'RSpec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

RSpec.describe do

    let(:board) {Board.new}
	let(:cruiser) {Ship.new("Cruiser", 3)}
	let(:submarine) {Ship.new("Submarine", 2)}
    let(:player1) {Player.new("Brad", board)}

    it "initialize" do
        expect(player1).to be_an_instance_of(Player)
        expect(player1.player_name).to eq("Brad")
        expect(player1.board).to eq(board)
    end

    it "player has lost" do
        board.place(cruiser, ["A1", "A2", "A3"])
		cell_1 = board.cells["A1"]
		cell_2 = board.cells["A2"]
		cell_3 = board.cells["A3"]
		cell_4 = board.cells["B1"]
		cell_5 = board.cells["B2"]
		board.place(submarine, ["A1", "B1"])
        expect(player1.has_lost?).to eq(false)
    end
end