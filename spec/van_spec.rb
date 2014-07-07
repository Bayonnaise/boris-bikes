require 'van'
require 'bike'
require 'docking_station'

describe 'Van' do
	let(:boris_van) { Van.new }
	let(:nagamura) {Bike.new}
	let(:nagamura_broken) {Bike.new.break!}
	let(:old_street) {DockingStation.new}

	it 'is empty when created' do
		expect(boris_van.bikes.count).to eq 0
	end

	it 'can collect a bike' do
		old_street.dock(nagamura)
		boris_van.collect_bike(nagamura, old_street)
		expect(boris_van.bikes).to eq [nagamura]
		expect(old_street.bikes.count).to eq 0
	end

	it 'can return a bike' do
		boris_van.collect_bike(nagamura, old_street)
		boris_van.return_bike(nagamura, old_street)
		expect(boris_van.bikes.count).to eq 0
		expect(old_street.bikes.count).to eq 1
	end

	it 'does not collect an unbroken bike' do
		bikes = [nagamura]
		boris_van.collect_for_repair(bikes, old_street)
		expect(boris_van.bikes.count).to eq 0
	end

	it 'collects broken bikes' do
		bikes = [nagamura, nagamura_broken]
		boris_van.collect_for_repair(bikes, old_street)
		expect(boris_van.bikes).to eq [nagamura_broken]
	end

	it 'does not return a broken bike' do
		bikes = [nagamura_broken]
		boris_van.collect_bike(nagamura_broken, old_street)
		boris_van.return_repaired(bikes, old_street)
		expect(boris_van.bikes.count).to eq 1
	end

	it 'returns fixed bikes' do
		bikes = [nagamura, nagamura_broken]
		boris_van.collect_bike(nagamura, old_street)
		boris_van.collect_bike(nagamura_broken, old_street)
		boris_van.return_repaired(bikes, old_street)
		expect(boris_van.bikes).to eq [nagamura_broken]
	end
end