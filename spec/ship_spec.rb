require 'RSpec'
require './lib/ship'
require 'pry'
RSpec.describe Ship do
		let(:cruiser) { Ship.new("Cruiser", 3)}

    it 'initializes' do
      expect(cruiser).to be_an_instance_of(Ship)
    end
    
    it 'has attributes' do
      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
      expect(cruiser.health).to eq(3)
    end

    it 'has sunk?' do
      expect(cruiser.sunk?).to eq(false)
    end

		it 'takes hits' do
			cruiser.hit
			expect(cruiser.health).to eq(2)
			cruiser.hit
			expect(cruiser.health).to eq(1)
			expect(cruiser.sunk?).to eq(false)
			cruiser.hit
			expect(cruiser.sunk?).to eq(true)
		end
end