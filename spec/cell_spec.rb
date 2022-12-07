require 'RSpec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    let(:cell) {cell = Cell.new("B4")}

    it 'initializes' do
        expect(cell).to be_an_instance_of(Cell)
    end
end