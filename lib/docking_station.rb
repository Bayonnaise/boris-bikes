class DockingStation
	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def bikes
		@bikes
	end

	def dock(bike)
		raise "Station is full" if full?
		bikes << bike
	end

	def undock(bike)
		bikes.delete(bike)
	end

	def full?
		bikes.count == @capacity
	end

end