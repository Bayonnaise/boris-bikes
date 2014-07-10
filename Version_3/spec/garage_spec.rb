require 'garage'

describe Garage do
	let(:garage) { Garage.new }

	it_behaves_like 'a bike container'

	it 'is empty when created' do
		expect(garage).to be_empty
	end

	it 'fixes bikes when accepting them' do
		broken = double :bike, broken?: true
		expect(broken).to receive(:fix!)
		garage.accept(broken)
	end
end