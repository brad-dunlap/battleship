require 'RSpec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require '.battleship'

RSpec.describe do
	let(:game) {Game.new}
	let(:board) {Board.new}
	let(:cruiser) {Ship.new("Cruiser", 3)}
	let(:submarine) {Ship.new("Submarine", 2)}

	it 'initializes' do
		expect(game).to be_an_instance_of(Game)
	end
	
	it 'places computer ships' do
		expect(game.computer_board.cells.values.map(&:ship).compact.empty?).to be true
		game.computer_place
		expect(game.computer_board.cells.values.map(&:ship).compact.empty?).to be false
	end

	
	it 'takes player input' do
		expect(player_cruiser_input).to eq(cruiser_coords)
		expect(game.player_board.cells.values.map(&:ship).compact.empty?).to be true
		game.player_place
		expect(game.player_board.cells.values.map(&:ship).compact.empty?).to be false
	end
end