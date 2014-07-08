require 'van'
require 'bike'
require 'docking_station'

describe Van do
	
	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }
	let(:van) { Van.new(:capacity => 20) }
	let(:docking_station) { DockingStation.new }

	it 'has no bikes when created' do
		expect(van.bikes.count).to eq 0
		expect(van.capacity). to eq 20
	end

	# it 'takes broken bikes from station' do
	# 	docking_station.dock(bike)
	# 	docking_station.dock(bike)
	# 	docking_station.dock(broken_bike)
	# 	van.takes_broken_bikes
	# 	expect(van.bikes_count). to eq 1
	# end

end