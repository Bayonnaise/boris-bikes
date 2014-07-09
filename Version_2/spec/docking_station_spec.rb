require 'docking_station'

describe DockingStation do
	let(:station) { DockingStation.new(:capacity => 20) }

	it_behaves_like 'a bike container'

	it 'has a capacity' do
		expect(station.capacity).to eq 20
	end

	it 'has no bikes when created' do
		expect(station.bikes.count).to eq 0
	end

end