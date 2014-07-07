require 'docking_station'
require 'bike'

describe DockingStation do
	let(:nagamura) { Bike.new }
	let(:old_street) { DockingStation.new }

	it 'has no bikes when created' do
		expect(old_street.bikes.count).to eq 0
	end

	it 'can dock a bike' do
		old_street.dock(nagamura)
		expect(old_street.bikes).to eq [nagamura]
	end

	it 'can undock a bike' do
		old_street.dock(nagamura)
		old_street.undock(nagamura)
		expect(old_street.bikes).not_to eq [nagamura]
	end

end