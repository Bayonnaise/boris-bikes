require './lib/bike_container'
require './lib/bike'
require './lib/van'

class ContainerHolder; include BikeContainer; 

end

describe BikeContainer do

	let(:bike) { Bike.new }
	let (:container) { ContainerHolder.new }
	let (:van) { Van.new }
	let (:broken_bike) { Bike.new.break! }
	let (:broken_bike2) {Bike.new.break! }

	def fill_container(container)
		(container.capacity).times { container.dock(Bike.new) }
	end

	it 'can dock a bike' do
		container.dock(bike)
		expect(container.bikes).to eq [bike]
	end

	it 'can release a bike' do
		container.dock(bike)
		container.release(bike)
		expect(container.bikes_count).to eq 0
	end

	it "should know when it's empty" do
		expect(container).to be_empty
	end

	it "should not release a bike that's not there" do
		expect(lambda { container.release(bike) }).to raise_error(RuntimeError)
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

	it 'should provide a list of the broken bikes' do
		container.dock(bike)
		container.dock(broken_bike)
		expect(container.unavailable_bikes). to eq([broken_bike])
	end

	it 'should only dock Bikes' do
		expect(lambda { container.dock(5) }).to raise_error(RuntimeError)
	end

	it 'should only release Bikes' do
		expect(lambda { container.release("string") }).to raise_error(RuntimeError)
	end

	it "should only release a bike if there's room in the destination" do
		container.dock(broken_bike)
		container.dock(broken_bike2)
		van.capacity = 1
		expect(lambda { van.takes_broken_bikes_from(container) }).to raise_error(RuntimeError)
		expect(container.bikes.count).to eq 1
	end
	
end