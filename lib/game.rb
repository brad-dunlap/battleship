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
		end
	end

	def computer_place
		comp_cruiser = Ship.new("Cruiser", 3)
		comp_sub = Ship.new("Submarine", 2)
		loop do
			cruiser_coords = []
			until cruiser_coords.length == comp_cruiser.length do
				cruiser_coords << @computer_board.cells.keys.sample
			end	
			if @computer_board.valid_placement?(comp_cruiser, cruiser_coords)
				@computer_board.place(comp_cruiser, cruiser_coords)
				break
			end
		end
		loop do
			sub_coords = []
			until sub_coords.length == comp_sub.length do
				sub_coords << @computer_board.cells.keys.sample
			end	
			if @computer_board.valid_placement?(comp_sub, sub_coords)
				@computer_board.place(comp_sub, sub_coords)
				break
			end
		end
	end

	def player_place
		player_cruiser = Ship.new("Cruiser", 3)
		player_sub = Ship.new("Submarine", 2)
		p "I have laid out my ships on the grid."
		sleep(0.8)
		p "You now need to lay out your two ships."
		sleep(0.8)
		p "The Cruiser is three units long and the Submarine is two units long."
		sleep(0.8)
		puts "#{player_board.render}" +
			"Enter the squares for the Cruiser (3 consecutive spaces):"

		cruiser_coords = []
		text = gets.chomp.to_s.upcase
		given_coords = text.split(//)
		require 'pry'; binding.pry
		loop do
			if @player_board.valid_placement?(player_cruiser, given_coords)
				@player_board.place(player_cruiser, given_coords)
			break
			else
				p "Those coordinates are not valid. Please enter valid coordinates"
			end
		end
	end
end