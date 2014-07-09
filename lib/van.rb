require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def takes_broken_bikes_from(station)
		station.unavailable_bikes.each do |bike|
			station.release(bike)
			self.dock(bike)
		end	
	end

	def delivers_broken_bikes_to(garage)
		self.unavailable_bikes.each do |bike|
			self.release(bike)
			garage.dock(bike)
		end
	end

	def takes_fixed_bikes_from(garage)
		garage.available_bikes.each do |bike|
			garage.release(bike)
			self.dock(bike)
		end
	end

	def delivers_fixed_bikes_to(station)
		self.available_bikes.each do |bike|
			self.release(bike)
			station.dock(bike)
		end
	end

end