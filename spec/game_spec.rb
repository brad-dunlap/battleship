require 'RSpec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


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

	it 'places a player ship' do
		expect(game.player_board.cells.values.map(&:ship).compact.empty?).to be true
	end

	it 'determines valid fire' do
		expect(game.valid_fire?("A1")).to be true
		expect(game.valid_fire?("A5")).to be false
	end
end