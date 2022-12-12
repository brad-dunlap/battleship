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
	
end