require 'van'

describe Van do

	let(:van) { Van.new }
	let(:bike) { double :bike }
	# let(:broken_bike) { Bike.new.break! }
	let(:docking_station) { double :docking_station, release: :bike, unavailable_bikes: [bike] }
	let(:garage) { double :garage }

	it_behaves_like 'a bike container'

	it 'has no bikes when created' do
		expect(van.bikes.count).to eq 0
	end

	it 'takes broken bikes from station' do
		expect(docking_station).to receive(:dock).with(bike)
		docking_station.dock(bike)
		expect(van).to receive(:takes).with([bike], docking_station)
		van.takes_broken_bikes_from(docking_station)
	end

	xit 'delivers broken bikes to garage' do
		van.dock(bike)
		van.dock(broken_bike)

		van.delivers_broken_bikes_to(garage)

		expect(van.bikes).to eq [bike]
		expect(garage.bikes).to eq [broken_bike]
	end

	xit 'takes fixed bikes from garage' do
		garage.dock(bike)
		garage.dock(broken_bike)

		van.takes_fixed_bikes_from(garage)

		expect(van.bikes).to eq [bike]
		expect(garage.bikes).to eq [broken_bike]
	end

	xit 'delivers fixed bikes to station' do
		van.dock(bike)
		van.dock(broken_bike)

		van.delivers_fixed_bikes_to(docking_station)

		expect(van.bikes).to eq [broken_bike]
		expect(docking_station.bikes).to eq [bike]
	end



end