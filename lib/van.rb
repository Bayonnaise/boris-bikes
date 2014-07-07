class Van

	def initialize
		@bikes = []
	end

	def bikes
		@bikes
	end

	def collect_bike(bike, docking_station)
		bikes << bike
		docking_station.undock(bike)
	end

	def return_bike(bike, docking_station)
		bikes.delete(bike)
		docking_station.dock(bike)
	end

	def collect_for_repair(bikes_to_collect, docking_station)
		bikes_to_collect.each do |bike|
			collect_bike(bike, docking_station) if bike.broken?
		end
	end

	def return_repaired(bikes_to_collect, docking_station)
		bikes_to_collect.each do |bike|
			return_bike(bike, docking_station) if !bike.broken?
		end
	end
end