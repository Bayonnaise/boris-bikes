require 'van'
require 'bike'

describe 'Van' do
	let(:boris_van) { Van.new }
	let(:nagamura) {Bike.new}
	let(:nagamura_broken) {Bike.new.break!}

	it 'is empty when created' do
		expect(boris_van.bikes.count).to eq 0
	end

	it 'can collect a bike' do
		boris_van.collect_bike(nagamura)
		expect(boris_van.bikes).to eq [nagamura]
	end

	it 'can return a bike' do
		boris_van.collect_bike(nagamura)
		boris_van.return_bike(nagamura)
		expect(boris_van.bikes.count).to eq 0
	end

	it 'does not collect an unbroken bike' do
		bikes = [nagamura]
		boris_van.collect_for_repair(bikes)
		expect(boris_van.bikes.count).to eq 0
	end

	it 'collects broken bikes' do
		bikes = [nagamura, nagamura_broken]
		boris_van.collect_for_repair(bikes)
		expect(boris_van.bikes).to eq [nagamura_broken]
	end

	it 'does not return a broken bike' do
		bikes = [nagamura_broken]
		boris_van.collect_bike(nagamura_broken)
		boris_van.return_repaired(bikes)
		expect(boris_van.bikes.count).to eq 1
	end

	it 'returns fixed bikes' do
		bikes = [nagamura, nagamura_broken]
		boris_van.collect_bike(nagamura)
		boris_van.collect_bike(nagamura_broken)
		boris_van.return_repaired(bikes)
		expect(boris_van.bikes).to eq [nagamura_broken]
	end
end