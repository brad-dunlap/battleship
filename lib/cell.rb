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
		if reveal_ship == true && empty? == false && fired_upon == false
			return "S"
		elsif fired_upon? == true && empty? == true
			return "M"
		elsif fired_upon? == true && empty? == false && @ship.sunk? == false
			return "H"
		elsif fired_upon? == true && empty? == false && @ship.sunk? == true
			return "X"
		else fired_upon? == false
			return "."
		end
	end
end