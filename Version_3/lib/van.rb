require_relative 'bike_container'

class Van
	
	include BikeContainer

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end
	
	def collect_bike_from(container, bike)
		container.release(bike) if !full?
		accept(bike)
	end

	def deliver_bike_to(container, bike)
		release(bike) if !container.full?
		container.accept(bike)
	end

	def collect_broken_bikes_from(container)
		container.broken_bikes.each { |bike| collect_bike_from(container, bike) }
	end

	def collect_working_bikes_from(container)
		container.working_bikes.each { |bike| collect_bike_from(container, bike) }
	end

	def deliver_broken_bikes_to(container)
		broken_bikes.each { |bike| deliver_bike_to(container, bike) }
	end

	def deliver_working_bikes_to(container)
		working_bikes.each { |bike| deliver_bike_to(container, bike) }
	end
end