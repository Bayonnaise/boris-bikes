require 'garage'
require 'bike'

describe Garage do
	
	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }
	let(:garage) { Garage.new(:capacity => 20) }

	it 'has no bikes when created' do
		expect(garage.bikes.count).to eq 0
		expect(garage.capacity). to eq 20
	end
	
end