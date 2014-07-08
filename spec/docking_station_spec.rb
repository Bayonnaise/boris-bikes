require 'docking_station'
require 'bike'

describe DockingStation do
	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }
	let(:station) { DockingStation.new(:capacity => 20) }

	def fill_station(station)
		20.times { station.dock(Bike.new) }
	end

	it 'has no bikes when created' do
		expect(station.bikes.count).to eq 0
	end

	it 'can dock a bike' do
		station.dock(bike)
		expect(station.bikes).to eq [bike]
	end

	it 'can undock a bike' do
		station.dock(bike)
		station.undock(bike)
		expect(station.bikes.count).to eq 0
	end

	it "should know when it's full" do
		expect(station).not_to be_full
		fill_station(station)
		expect(station).to be_full
	end
	
	it 'should not accept a bike if the station is full' do
		fill_station(station)
		expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
	end

	it 'should provide a list of available bikes' do   
		station.dock(bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([bike])
	end
end