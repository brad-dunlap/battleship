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

	it 'determines valid fire on computer' do
		expect(game.valid_fire_on_comp?("A1")).to be true
		expect(game.valid_fire_on_comp?("A5")).to be false
		game.computer_board.cells["A1"].fire_upon
		expect(game.valid_fire_on_comp?("A1")).to be false
	end

	it 'determines valid fire on player' do
		expect(game.valid_fire_on_player?("A1")).to be true
		expect(game.valid_fire_on_player?("A5")).to be false
		game.player_board.cells["A1"].fire_upon
		expect(game.valid_fire_on_player?("A1")).to be false
	end

	it 'can fire upon computer ships' do
		expect(game.computer_board.cells["A1"].fired_upon?).to be false
		player_shot = "A1"		
		game.computer_board.cells["A1"].fire_upon
		expect(game.computer_board.cells["A1"].fired_upon?).to be true
	end

	it 'can fire upon player ships' do
		expect(game.player_board.cells["A1"].fired_upon?).to be false
		game.player_board.cells["A1"].fire_upon
		expect(game.player_board.cells["A1"].fired_upon?).to be true
	end

	it 'can determine winner' do
		game.computer_place
		allow(game).to receive(:gets).and_return("a2 a3 a4")
		game.player_place_cruiser
		allow(game).to receive(:gets).and_return("b1 c1")
		game.player_place_sub
		expect(game.winner?).to be false
		game.player_board.cells["A2"].fire_upon
		game.player_board.cells["A3"].fire_upon
		game.player_board.cells["A4"].fire_upon
		game.player_board.cells["B1"].fire_upon
		game.player_board.cells["C1"].fire_upon
		expect(game.winner?).to be true
	end
end