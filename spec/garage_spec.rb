require 'bike'
require 'garage'
require 'van'

describe Garage do
	let(:nagamura_broken) { Bike.new.break! }
	let(:garage) { Garage.new }
	let(:boris_van) { Van.new }

	it 'has no bikes when created' do
		expect(garage.bikes.count).to eq 0
	end

	it 'can receive a bike' do
		garage.receive(nagamura_broken)
		expect(garage.bikes).to eq [nagamura_broken]
	end
end