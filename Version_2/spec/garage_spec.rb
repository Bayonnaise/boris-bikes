require 'garage'

describe Garage do

	let(:garage) { Garage.new(:capacity => 20) }
	let(:bike) { double :bike }

	it_behaves_like 'a bike container'

	it 'has no bikes when created' do
		expect(garage.bikes.count).to eq 0
	end

	it 'fixes all bikes in garage' do
		garage.dock(bike)
		expect(bike).to receive(:fix!)
		garage.fix_bikes
	end

end