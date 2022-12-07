require 'RSpec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    let(:cell) {cell = Cell.new("B4")}
    let(:cruiser) { Ship.new("Cruiser", 3)}

    it 'initializes' do
        expect(cell).to be_an_instance_of(Cell)
        expect(cell.coordinate).to eq("B4")
        expect(cell.ship).to eq(nil)
    end

    it "determines the cell is empty" do
        expect(cell.empty?).to eq(true)
    end

    it "can place ship" do
        cell.place_ship(cruiser)
        expect(cell.ship).to eq(cruiser)
        expect(cell.empty?).to eq(false)
    end

    it "can be fired upon" do
        cell.place_ship(cruiser)
        expect(cell.fired_upon?).to eq(false)
        cell.fire_upon
        expect(cell.ship.health).to eq(2)
        expect(cell.fired_upon?).to eq (true)
    end
end