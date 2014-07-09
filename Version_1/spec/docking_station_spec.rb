require 'docking_station'
require 'bike'

describe DockingStation do
	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }
	let(:station) { DockingStation.new(:capacity => 20) }

	it 'has no bikes when created' do
		expect(station.bikes.count).to eq 0
		expect(station.capacity). to eq 20
	end

end