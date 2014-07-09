require 'person'

describe Person do

	it 'has no bike' do
		person = Person.new
		expect(person).not_to have_bike
	end

	it 'can have a bike' do
		person = Person.new(:bike)
		expect(person).to have_bike
	end

	it 'breaks a bike in an accident' do
		bike = double :bike
		person = Person.new(bike)
		expect(bike).to receive(:break!)
		person.crash
	end

	it 'can rent a bike from a station' do
		station = double :docking_station
		person = Person.new

		expect(station).to receive(:undock)
		person.rent_bike_from(station)
	end
	
	it 'has a bike after renting one' do
		person = Person.new
		station = double :docking_station, undock: :bike

		person.rent_bike_from(station)
		expect(person).to have_bike
	end
end