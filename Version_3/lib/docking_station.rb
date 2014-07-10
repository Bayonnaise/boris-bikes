require 'bike'

class DockingStation
	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def capacity
		@capacity
	end	

	def empty?
		bike_count == 0
	end

	def full?
		bike_count == capacity
	end

	def bike_count
		@bikes.count
	end

	def accept_bike
		raise "No more room!" if full?
		@bikes << Bike.new
	end

	def release_bike
		@bikes.pop
	end
end