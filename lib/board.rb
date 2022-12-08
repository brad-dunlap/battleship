require './lib/board'

class Board
    attr_reader :cells

    def initialize(cells)
    	@cells = cells
		end

	def cells
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
		valid_coordinate = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
		if valid_coordinate.include? coordinate
			true
		else
			false
		end
	end

	def valid_placement?(ship_type, array)
		added_cells = []
		array.each do |element|
			added_cells << element.split.to_i.sum
		end
		
		# # break A1 into two integers, += 1?
		# if ship_type == "cruiser"
		# 	if array.each_cons(3).all? { |a, b, c| a
		# 		if array.length == 3
		# 			true
		# 		else 
		# 			false
		# 		end
		# 	else false
		# 	end
# 		elsif ship_type == "submarine" 
# 			if array.each_cons(2).all? { |a, b| a == array.last.first && b == array.last[1]}
# 				if array.length == 2
# 					true
# 				else
# 					false
# 				end
# 			else
# 				false
# 			end
# 		else
# 			false
# 		end
# 	end
# end
			