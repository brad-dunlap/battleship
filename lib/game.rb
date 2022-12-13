require './lib/board'

class Game 
	attr_reader :player_board, :computer_board
	def initialize
		@player_board = Board.new
		@computer_board = Board.new
	end
	
	def start_game		
		puts "\n"+
		"                          Welcome to\n" +
		"\n"
		sleep(1)
		puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
		"   ____    _  _____ _____ _     _____ ____  _   _ ___ ____\n" +
		"  | __ )  / ||_   _|_   _| |   | ____/ ___|| | | |_ _|  _  \n" +
		"  |  _   / _|  | |   | | | |   |  _|  ___  | |_| || || |_) |\n" +
		"  | |_) / __|  | |   | | | |___| |___ ___) |  _  || ||  __/\n" +
		"  |____/_/  |  |_|   |_| |_____|_____|____/|_| |_|___|_|\n" +
		"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
		"\n"
		sleep(1.5)
		puts "Enter p to play. Enter q to quit."
		loop do
			text = gets.chomp
			if text == "p"
				break
			elsif text == "q"
				puts "I guess you are too scared to play against me"
				exit(true)
			else 
				puts "Invalid entry. Please enter p to play or q to quit"
			end
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

	def prompt_player_to_place
		sleep(1)
		p "I have laid out my ships on the grid."
		sleep(1)
		p "You now need to lay out your two ships."
		sleep(1)
		p "The Cruiser is three units long and the Submarine is two units long."
		sleep(1)
		p "--------Player Board-------->"
		puts "#{player_board.render}" +
		"Enter the squares for the Cruiser (3 consecutive spaces):\n>"
	end

	def player_place_cruiser
		player_cruiser = Ship.new("Cruiser", 3)
		loop do
			input = gets.chomp.upcase.split
			if @player_board.valid_placement?(player_cruiser, input)
				@player_board.place(player_cruiser, input)
				break
			else 
				p "Those coordinates are not valid. Please enter valid coordinates"
			end
		end
	end

	def player_place_sub
		puts "Now enter the squares for the Submarine (2 consective spaces):\n>"
		player_sub = Ship.new("Submarine", 2)
		loop do
			input = gets.chomp.upcase.split
			if @player_board.valid_placement?(player_sub, input)
				@player_board.place(player_sub, input)
				break
			else 
				p "Those are invalid coordinates. Please try again:"
			end
		end
	end

	def valid_fire?(coord)
		if @computer_board.valid_coordinate?(coord) == true && @computer_board.cells[coord].fired_upon? == false
			true
		 else
			false
		end
	end

	def display_player_board
		puts "---------Player Board----------"
		puts "#{player_board.render(true)}" 
	end

	def display_comp_board
		puts "---------Computer Board----------"
		puts "#{computer_board.render}" 
	end

	def player_turn
		loop do 
			display_comp_board
			display_player_board
			puts "Please select a coordinate to fire upon:"
			player_shot = gets.chomp.upcase
			if valid_fire?(player_shot)
				@computer_board.cells[player_shot].fire_upon
				break
			else
				puts "Not a valid selection. Please try again:"
			end
		end
	end
end