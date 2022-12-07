class Cell
    attr_reader :coordinate,
                :ship,
                :fired_upon

    def initialize(coordinate, fired_upon = false)
        @coordinate = coordinate
        @ship = ship
        @fired_upon = fired_upon
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
			if cell.empty? = false
				ship.hit
			end
		end
end