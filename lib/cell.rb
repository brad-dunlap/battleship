require './lib/ship'
class Cell
    attr_reader :coordinate,
                :ship,
                :fired_upon

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
				
    end

    def empty?
        !@ship
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon? 
        if fired_upon == true
        true
       else
        false
       end
    end

    def fire_upon
			@fired_upon = true
			if empty? == false
				ship.hit
			end
		end
		
		def render(reveal_ship = false)
			if reveal_ship == true && @ship.sunk? == false && @ship
				p "S"
			elsif @fired_upon == true
				if @ship
					if ship.sunk? == true
						p "X"
						else 
						p "H"
					end
				else
					p "M"
				end
			else
				p "."
			end
		end
	end


	

	

		
	
