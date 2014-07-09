module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bikes_count
		bikes.count
	end

	def dock(bike)
		raise "There's no room" if full?
		raise "That's not a bike" if !bike.is_a? Bike
		bikes << bike
	end

	def release(bike)
		raise "There are no bikes" if empty?
		bikes.delete(bike)
	end

	def full?
		bikes.count == capacity
	end

	def empty?
		bikes.count == 0
	end

	def available_bikes
  		@bikes.reject {|bike| bike.broken? }
	end

	def unavailable_bikes
		@bikes.select {|bike| bike.broken? }
	end

end