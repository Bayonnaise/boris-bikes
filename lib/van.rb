require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def takes_broken_bikes(station)
		station.unavailable_bikes.each do |bike|
			station.release(bike)
			self.dock(bike)
		end	
	end
end