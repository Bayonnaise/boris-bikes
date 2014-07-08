require 'docking_station'
require 'bike'

describe DockingStation do
	let(:nagamura) { Bike.new }
	let(:old_street) { DockingStation.new }
	let(:station) { DockingStation.new(:capacity => 20) }

	def fill_station(station)
		20.times { station.dock(Bike.new) }
	end

	it 'has no bikes when created' do
		expect(old_street.bikes.count).to eq 0
	end

	it 'can dock a bike' do
		old_street.dock(nagamura)
		expect(old_street.bikes).to eq [nagamura]
	end

	it 'can undock a bike' do
		old_street.dock(nagamura)
		old_street.undock(nagamura)
		expect(old_street.bikes).not_to eq [nagamura]
	end

	it "should know when it's full" do
		expect(station).not_to be_full
		fill_station(station)
		expect(station).to be_full
	end
	
	it 'should not accept a bike if the station is full' do
		fill_station(station)
		expect(lambda { station.dock(nagamura) }).to raise_error(RuntimeError)
	end

	it 'should provide a list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new.break!    
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end
end