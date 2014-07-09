require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def takes_broken_bikes_from(station)
		station.unavailable_bikes.each do |bike|
			station.release(bike) if !self.full?
			self.dock(bike)
		end	
	end

	def delivers_broken_bikes_to(garage)
		self.unavailable_bikes.each do |bike|
			self.release(bike) if !garage.full?
			garage.dock(bike)
		end
	end

	def takes_fixed_bikes_from(garage)
		garage.available_bikes.each do |bike|
			garage.release(bike) if !self.full?
			self.dock(bike)
		end
	end

	def delivers_fixed_bikes_to(station)
		self.available_bikes.each do |bike|
			self.release(bike) if !station.full?
			station.dock(bike)
		end
	end

end



# def delivers_fixed_bikes_to(x, y, a, )
# 	(y).(a).each do |bike|
# 		(y).release(bike) if !(x).full?
# 		(x).dock(bike)
# 	end
# end


