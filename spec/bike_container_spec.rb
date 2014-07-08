require './lib/bike_container'
require './lib/bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) { Bike.new }
	let (:container) { ContainerHolder.new }
	let (:broken_bike) { Bike.new.break! }

	def fill_container(container)
		10.times { container.dock(Bike.new) }
	end

	it 'can dock a bike' do
		container.dock(bike)
		expect(container.bikes).to eq [bike]
	end

	it 'can undock a bike' do
		container.dock(bike)
		container.undock(bike)
		expect(container.bikes.count).to eq 0
	end

	it "should know when it's full" do
		expect(container).not_to be_full
		fill_container(container)
		expect(container).to be_full
	end
	
	it 'should not accept a bike if the container is full' do
		fill_container(container)
		expect(lambda { container.dock(bike) }).to raise_error(RuntimeError)
	end

	it 'should provide a list of available bikes' do   
		container.dock(bike)
		container.dock(broken_bike)
		expect(container.available_bikes).to eq([bike])
	end
	
end