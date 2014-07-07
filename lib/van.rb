class Van

	def initialize
		@bikes = []
	end

	def bikes
		@bikes
	end

	def collect_bike(bike)
		bikes << bike
	end

	def return_bike(bike)
		bikes.delete(bike)
	end

	def collect_for_repair(bikes_to_collect)
		bikes_to_collect.each do |bike|
			collect_bike(bike) if bike.broken?
		end
	end

	def return_repaired(bikes_to_collect)
		bikes_to_collect.each do |bike|
			return_bike(bike) if !bike.broken?
		end
	end
end