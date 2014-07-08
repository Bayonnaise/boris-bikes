require 'van'
require 'bike'
require 'docking_station'
require 'garage'

describe Van do
	
	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }
	let(:van) { Van.new(:capacity => 20) }
	let(:docking_station) { DockingStation.new }
	let(:garage) { Garage.new }

	it 'has no bikes when created' do
		expect(van.bikes.count).to eq 0
		expect(van.capacity). to eq 20
	end

	it 'takes broken bikes from station' do
		docking_station.dock(bike)
		docking_station.dock(broken_bike)

		van.takes_broken_bikes_from(docking_station)
		
		expect(van.bikes).to eq [broken_bike]
		expect(docking_station.bikes).to eq [bike]
	end

	it 'delivers broken bikes to garage' do
		van.dock(bike)
		van.dock(broken_bike)

		van.delivers_broken_bikes_to(garage)

		expect(van.bikes).to eq [bike]
		expect(garage.bikes).to eq [broken_bike]
	end
end