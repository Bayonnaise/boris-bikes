module BikeContainer

	DEFAULT_CAPACITY = 10
	
	attr_reader :bikes

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def empty?
		bikes.count == 0
	end

	def full?
		bikes.count == capacity
	end

	def accept(bike)
		raise "No more room!" if full?
		bikes << bike
	end

	def release(bike)
		raise "No more bikes to release!" if empty?
		bikes.delete(bike)
	end

	def working_bikes
		bikes.reject(&:broken?)
	end

	def broken_bikes
		bikes.select(&:broken?)
	end

end