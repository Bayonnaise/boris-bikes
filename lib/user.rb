class User

	def initialize
		@bikes = []
	end

	def bikes
		@bikes
	end

	def rent_bike(bike, docking_station)
		bikes << bike
		docking_station.undock(bike)
	end

	def return_bike(bike, docking_station)
		bikes.delete(bike)
		docking_station.dock(bike)
	end

	def break_bike(bike)
		bike.break!
	end
end
