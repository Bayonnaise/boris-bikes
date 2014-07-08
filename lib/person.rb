class Person

	def initialize(bike = nil)
		@bike = bike
	end

	def has_bike?
		!@bike.nil?
	end

	def crash
		@bike.break!
	end

	def rent_bike_from(docking_station)
		@bike = docking_station.undock
	end

end