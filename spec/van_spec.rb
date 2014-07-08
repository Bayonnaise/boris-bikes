require 'van'
require 'bike'

describe Van do
	
	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }
	let(:van) { Van.new(:capacity => 20) }

	it 'has no bikes when created' do
		expect(van.bikes.count).to eq 0
		expect(van.capacity). to eq 20
	end

end