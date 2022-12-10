require './lib/board'
class Game 
	attr_reader :player, :player2
	def initialize(player, player2 = "computer")
		@player = player
		@player_board = Board.new
		@player2 = player2
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
			@computer_board.place(cruiser, @cells.sample(3))
			require 'pry'; binding.pry
		end
	end
end