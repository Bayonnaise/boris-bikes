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

	it 'fixes all bikes in garage' do
		garage.dock(broken_bike)
		garage.dock(bike)
		garage.fix_bikes
		expect(broken_bike.broken?).to eq false
	end
	
end