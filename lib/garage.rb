class Garage
	def initialize
		@bikes = []
	end

	def bikes
		@bikes
	end

	def receive(bike)
		bikes << bike
	end
end