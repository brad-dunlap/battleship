require './lib/board'
class Game 
	attr_reader :player_board, :computer_board
	def initialize
		@player_board = Board.new
		@computer_board = Board.new
	end

	def start_game		
		puts "Welcome to BATTLESHIP
		Enter p to play. Enter q to quit."
		text = gets.chomp
		if text == "q"
			puts "Come back when you're ready to actually play"
		elsif text != "p"
			"Invalid entry. Please enter p to play or q to quit"
		else text == "p"
			until computer_board.valid_placement?("Cruiser", 3) do @cells.sample(3)
			require 'pry'; binding.pry
		end
	end
end