class User

	def initialize
		@bikes = []
	end

	def bikes
		@bikes
	end

	def rent_bike(bike)
		bikes << bike
	end

	def return_bike(bike)
		bikes.delete(bike)
	end
end
