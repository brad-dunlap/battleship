require './lib/board'

class Board
    attr_reader :cells

  def initialize
    @cells = create_cells
	end

	def create_cells
		{
			"A1" => Cell.new("A1"),
			"A2" => Cell.new("A2"),
			"A3" => Cell.new("A3"),
			"A4" => Cell.new("A4"),
			"B1" => Cell.new("B1"),
			"B2" => Cell.new("B2"),
			"B3" => Cell.new("B3"),
			"B4" => Cell.new("B4"),
			"C1" => Cell.new("C1"),
			"C2" => Cell.new("C2"),
			"C3" => Cell.new("C3"),
			"C4" => Cell.new("C4"),
			"D1" => Cell.new("D1"),
			"D2" => Cell.new("D2"),
			"D3" => Cell.new("D3"),
			"D4" => Cell.new("D4")
		}
	end

	def valid_coordinate?(coordinate)
		cells.map.any? {|key, value| key == coordinate}
	end

	def valid_placement?(ship_type, array)
		letters = array.map { |coordinate| coordinate.split('').first.ord}
		numbers = array.map { |coordinate| coordinate.split('').last.to_i}
		
		if array.all? {|coordinate| @cells[coordinate].empty?}
			if ship_type.name == "Cruiser"
				if letters.length == 3
					if letters.each_cons(3).all? {|a, b, c| a == b && b == c}
						if numbers.each_cons(3).all? {|num1, num2, num3| num1 + 1 == num2 && num2 + 1 == num3}
							true
						else
							false
						end
					elsif letters.each_cons(3).all? {|a, b, c| a + 1 == b && b + 1 == c}
							if numbers.each_cons(3).all? {|num1, num2, num3| num1 == num2 && num2 == num3}
							true
						else
							false
						end
					else
						false
					end
				else
					false
				end
			elsif ship_type.name == "Submarine"
				if letters.length == 2
					if letters.each_cons(2).all? {|a, b| a == b}
						if numbers.each_cons(2).all? {|num1, num2| num1 + 1 == num2}
							true
						else
							false
						end
					elsif letters.each_cons(2).all? {|a, b| a + 1 == b}
						if numbers.each_cons(2).all? {|num1, num2| num1 == num2}
							true
						else
							false
						end
					else
						false
					end
				else
					false
				end
			else
				false
			end
		else
			false
		end
	end
	
	def place(ship_type, array)
		if array.all? {|coordinate| @cells[coordinate].empty?}
			if array.map {|coordinate| valid_coordinate?(coordinate) && valid_placement?(ship_type, array)}
				array.map {|coordinate| @cells[coordinate].place_ship(ship_type)}
			end
		end
	end

	def render
		blank_board = @cells.map {|keys, value| @cells[keys].render}
		space_board = blank_board.map {|dot| dot.gsub('.','. ')}
		split_board = space_board.each_slice(4).to_a
		# p "  1 2 3 4 \nA"
	end

end


		
	