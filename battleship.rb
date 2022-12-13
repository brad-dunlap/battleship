require './lib/game'
require './lib/ship'
require './lib/cell'
require './lib/board'

game = Game.new
game.start_game
game.prompt_player_to_place
game.player_place_cruiser
game.player_place_sub
game.player_turn
