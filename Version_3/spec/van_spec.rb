require 'van'

describe Van do
	let(:van) { Van.new }
	let(:bike) { double :bike }
	let(:container) { double :container, broken_bikes: [broken], working_bikes: [working] }
	let(:broken) { double :bike, broken?: true }
	let(:working) { double :bike, broken?: false }

	it_behaves_like 'a bike container'

	it 'is empty when created' do
		expect(van).to be_empty
	end

	it 'collects a bike from a container' do
		expect(container).to receive(:release).with(bike)
		expect(van).to receive(:accept).with(bike)
		van.collect_bike_from(container, bike)
	end

	it 'delivers a bike to a container' do
		expect(van).to receive(:release).with(bike)
		expect(container).to receive(:full?)
		expect(container).to receive(:accept).with(bike)
		van.deliver_bike_to(container, bike)
	end

	it 'collects broken bikes from container' do
		expect(container).to receive(:broken_bikes)
		expect(van).to receive(:collect_bike_from).with(container, broken)
		van.collect_broken_bikes_from(container)
	end

	it 'collects working bikes from container' do
		expect(container).to receive(:working_bikes)
		expect(van).to receive(:collect_bike_from).with(container, working)
		van.collect_working_bikes_from(container)
	end

	it 'delivers broken bikes to container' do
		expect(van).to receive(:broken_bikes).and_return([broken])
		expect(van).to receive(:deliver_bike_to).with(container, broken)
		van.deliver_broken_bikes_to(container)
	end

	it 'delivers working bikes to container' do
		expect(van).to receive(:working_bikes).and_return([working])
		expect(van).to receive(:deliver_bike_to).with(container, working)
		van.deliver_working_bikes_to(container)
	end
end