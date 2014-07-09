require 'bike'

describe Bike do

	let(:bike) { Bike.new }

	it 'should not be broken when created' do
		expect(bike.broken?).to be false
	end

	it 'can be broken' do
		bike.break!
		expect(bike.broken?).to be true
	end

	it 'can be fixed' do
		bike.break!
		bike.fix!
		expect(bike.broken?).to be false
	end
end