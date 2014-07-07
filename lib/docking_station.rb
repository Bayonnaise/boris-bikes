class DockingStation
	def initialize
		@bikes = []
	end

	def bikes
		@bikes
	end

	def dock(bike)
		bikes << bike
	end

	def undock(bike)
		bikes.delete(bike)
	end
end