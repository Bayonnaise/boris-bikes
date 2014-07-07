require 'docking_station'
require 'bike'

describe DockingStation do
	it 'has no bikes when created' do
		old_street = DockingStation.new
		expect(old_street.bikes.count).to eq 0
	end

	it 'can dock a bike' do
		nagamura = Bike.new
		old_street = DockingStation.new
		old_street.dock(nagamura)
		expect(old_street.bikes).to eq [nagamura]
	end

end