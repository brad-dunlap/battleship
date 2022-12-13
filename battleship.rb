require './lib/game'
require './lib/ship'
require './lib/cell'
require './lib/board'

game = Game.new
game.start_game
game.computer_place
game.prompt_player_to_place
game.player_place_cruiser
game.player_place_sub
game.turns
game.reveal_boards
game.return_to_menu