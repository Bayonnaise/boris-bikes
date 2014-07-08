require 'user'
require 'bike'
require 'docking_station'

describe User do
	let(:user) {User.new}
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}

	it 'user does not have a bike initially' do
		expect(user.bikes.count).to eq 0
	end

	it 'can rent a bike' do
		station.dock(bike)
		user.rent_bike(bike, station)
		expect(user.bikes).to eq [bike]
		expect(station.bikes.count).to eq 0
	end

	it 'can return a bike' do
		station.dock(bike)
		user.rent_bike(bike, station)
		user.return_bike(bike, station)
		expect(user.bikes).not_to eq [bike]
		expect(station.bikes.count).to eq 1
	end

	it 'can break a bike' do
		station.dock(bike)
		user.rent_bike(bike, station)
		user.break_bike(bike)
		expect(bike.broken?).to eq true
	end

end