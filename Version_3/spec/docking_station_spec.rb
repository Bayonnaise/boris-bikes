require 'docking_station'

describe DockingStation do
	let(:station) { DockingStation.new }

	it_behaves_like 'a bike container'

	it 'is empty when created' do
		expect(station).to be_empty
	end
	
end