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
		game.computer_place
		
		expect(game.computer_board.cells.values.map(&:ship).compact.empty?).to be false
	end
end