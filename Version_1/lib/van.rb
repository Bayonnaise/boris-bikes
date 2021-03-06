require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def takes_broken_bikes_from(from_station)
		takes(from_station.unavailable_bikes, from_station)
	end

	def takes_fixed_bikes_from(from_station)
		takes(from_station.available_bikes, from_station)
	end

	def delivers_fixed_bikes_to(to_station)
		delivers(self.available_bikes, to_station)
	end

	def delivers_broken_bikes_to(to_station)
		delivers(self.unavailable_bikes, to_station)
	end

	def takes(bikes, from_station)
		bikes.each do |bike|
			from_station.release(bike) if !self.full?
			self.dock(bike)
		end
	end

	def delivers(bikes, to_station)
		bikes.each do |bike|
			self.release(bike) if !to_station.full?
			to_station.dock(bike)
		end
	end
end

