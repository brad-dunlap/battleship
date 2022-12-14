require './lib/board'

class Game 
	attr_reader :player_board, :computer_board, :comp_cruiser, :comp_sub, :player_cruiser, :player_sub
	def initialize
		@player_board = Board.new
		@computer_board = Board.new
		@comp_cruiser = Ship.new("Cruiser", 3)
		@comp_sub = Ship.new("Submarine", 2)
		@player_cruiser = Ship.new("Cruiser", 3)
		@player_sub = Ship.new("Submarine", 2)
	end
	
	def start_game		
		puts "\n"+
		"                          Welcome to\n" +
		"\n"
		sleep(0.8)
		puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
		"   ____    _  _____ _____ _     _____ ____  _   _ ___ ____\n" +
		"  | __ )  / ||_   _|_   _| |   | ____/ ___|| | | |_ _|  _  \n" +
		"  |  _   / _|  | |   | | | |   |  _|  ___  | |_| || || |_) |\n" +
		"  | |_) / __|  | |   | | | |___| |___ ___) |  _  || ||  __/\n" +
		"  |____/_/  |  |_|   |_| |_____|_____|____/|_| |_|___|_|\n" +
		"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
		"\n"
		sleep(0.8)
		puts "Enter p to play. Enter q to quit."
		puts ""
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
		loop do
			cruiser_coords = []
			until cruiser_coords.length == @comp_cruiser.length do
				cruiser_coords << @computer_board.cells.keys.sample
			end	
			if @computer_board.valid_placement?(@comp_cruiser, cruiser_coords)
				@computer_board.place(@comp_cruiser, cruiser_coords)
				break
			end
		end
		loop do
			sub_coords = []
			until sub_coords.length == @comp_sub.length do
				sub_coords << @computer_board.cells.keys.sample
			end	
			if @computer_board.valid_placement?(@comp_sub, sub_coords)
				@computer_board.place(@comp_sub, sub_coords)
				break
			end
		end
	end
	
	def prompt_player_to_place
		sleep(0.8)
		puts "I have laid out my ships on the grid."
		puts ""
		sleep(0.8)
		puts "You now need to lay out your two ships."
		puts ""
		sleep(0.8)
		puts "The Cruiser is three units long and the Submarine is two units long."
		puts ""
		sleep(0.8)
		p "--------Player Board-------->"
		puts "#{player_board.render}" +
		"Enter the squares for the Cruiser (3 consecutive spaces):\n>"
		puts ""
	end
	
	def player_place_cruiser
		loop do
			input = gets.chomp.upcase.split
			if @player_board.valid_placement?(@player_cruiser, input)
				@player_board.place(@player_cruiser, input)
				break
			else 
				p "Those coordinates are not valid. Please enter valid coordinates"
				puts ""
			end
		end
	end
	
	def player_place_sub
		puts "Now enter the squares for the Submarine (2 consective spaces):\n>"
		puts ""
		loop do
			input = gets.chomp.upcase.split
			if @player_board.valid_placement?(@player_sub, input)
				@player_board.place(@player_sub, input)
				break
			else 
				p "Those are invalid coordinates. Please try again:"
				puts ""
			end
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

	def display_comp_board_game_over
		puts "---------Computer Board----------"
		puts "#{computer_board.render(true)}" 
	end

	def valid_fire_on_comp?(coord)
		if @computer_board.valid_coordinate?(coord) == true && @computer_board.cells[coord].fired_upon? == false
			true
		 else
			false
		end
	end

	def valid_fire_on_player?(coord)
		if @player_board.valid_coordinate?(coord) == true && @player_board.cells[coord].fired_upon? == false
			true
		 else
			false
		end
	end


	def player_turn
		sleep(0.8)
		display_comp_board
		display_player_board
		sleep(0.8)
		puts "Please select a coordinate to fire upon:"
		puts ""
		loop do 
			player_shot = gets.chomp.upcase
			if valid_fire_on_comp?(player_shot)
				@computer_board.cells[player_shot].fire_upon
				if @computer_board.cells[player_shot].render == "X"
					sleep(0.8)
					puts "You sunk my ship!"
					puts ""
				elsif @computer_board.cells[player_shot].render == "H"
					sleep(0.8)
					puts "You hit my ship!"
					puts ""
				else 
					puts "You missed! Haha!"
					puts ""
					sleep(0.8)
				end
				break
			else
				sleep(0.8)
				puts "Not a valid selection. Please try again:"
				puts ""
			end
		end
		sleep(0.8)
		display_comp_board
		display_player_board
	end

	def computer_turn
		sleep(0.8)
		puts "Okay, my turn!"
		puts ""
		sleep(0.8)
		loop do
			computer_choice = @player_board.cells.keys.sample
			if valid_fire_on_player?(computer_choice)
				@player_board.cells[computer_choice].fire_upon
					if @player_board.cells[computer_choice].render == "X"
						puts "I sunk your ship!"
						puts ""
					elsif @player_board.cells[computer_choice].render == "H"
						puts "I hit your ship!"
						puts ""
					else 
						puts "Oh no!!! I missed!!"
						puts ""
					end
				break
			end
		end
	end

	def winner?
		if @comp_sub.sunk? && @comp_cruiser.sunk? 
			puts "You win this time..."
			puts ""
			true
		elsif @player_sub.sunk? && @player_cruiser.sunk?
			puts "I win! Try again next time LOSER! >:^{"
			puts ""
			true
		else
			false
		end
	end
	
	def turns
		loop do
			player_turn
			if winner? == true
				break
			end
			computer_turn
			if winner? == true
				break
			end
		end
	end

	def reveal_boards
		puts "Here is where I hid my ships!"
		puts ""
		display_comp_board_game_over
		display_player_board
	end

	def return_to_menu
		puts "Would you like to play again?"
		puts ""
		sleep(2)
		start_game
	end
end