require 'bike_container'

shared_examples 'a bike container' do
	let(:container) { described_class.new }
	let(:bike) { double :bike }

	def fill_container
		container.capacity.times { container.accept(bike) }
	end

	it 'should accept a bike' do 
		container.accept(bike)
		expect(container.bikes).to eq [bike]
	end

	it "knows when it's full" do
		expect(container).not_to be_full
		fill_container
		expect(container).to be_full
	end

	it 'should not accept a bike if full' do
		fill_container
		expect(lambda { container.accept(bike) }).to raise_error(RuntimeError)
	end

	it 'releases a bike' do
		container.accept(bike)
		container.release(bike)
		expect(container).to be_empty
	end

	it 'should not release a bike if empty' do
		expect(lambda { container.release(bike)}).to raise_error(RuntimeError)
	end

	it 'provides a list of available bikes' do
		broken = double :bike, broken?: true
		working = double :bike, broken?: false
		container.accept(broken)
		container.accept(working)
		expect(container.working_bikes).to eq [working]	
	end

	it 'provides a list of broken bikes' do
		broken = double :bike, broken?: true
		working = double :bike, broken?: false
		container.accept(broken)
		container.accept(working)
		expect(container.broken_bikes).to eq [broken]
	end

end