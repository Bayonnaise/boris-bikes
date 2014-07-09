require 'bike'

describe Bike do

	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }
	
	it 'should not be broken when created' do
		expect(bike.broken?).to be false
	end

	it 'can be broken' do
		expect(broken_bike.broken?).to be true
	end

	it 'can be fixed' do
		broken_bike.fix!
		expect(broken_bike.broken?).to be false
	end
end