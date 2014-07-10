require_relative 'bike_container'

class Garage
	include BikeContainer

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def accept(bike)
		raise "No more room!" if full?
		bike.fix!
		bikes << bike
	end

end