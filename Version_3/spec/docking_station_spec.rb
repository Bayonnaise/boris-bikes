require 'docking_station'

describe 'docking station' do
	let(:station) { DockingStation.new }

	def fill_station
		station.capacity.times { station.accept_bike }
	end

	it 'is empty when created' do
		expect(station).to be_empty
	end

	it "knows when it's full" do
		expect(station).not_to be_full
		10.times { station.accept_bike }
		expect(station).to be_full
	end

	it 'accepts a bike' do
		station.accept_bike
		expect(station.bike_count).to eq 1
	end

	it 'releases a bike' do
		station.accept_bike
		station.release_bike
		expect(station).to be_empty
	end

	it 'should not accept a bike if full' do
		fill_station
		expect(lambda { station.accept_bike }).to raise_error(RuntimeError)
	end
end