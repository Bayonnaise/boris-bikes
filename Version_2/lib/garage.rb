require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def fix_bikes
		self.bikes.each do |bike|
			bike.fix!
		end
	end
end