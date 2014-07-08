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
end