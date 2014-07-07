require 'user'
require 'bike'

describe User do
	let(:bill) {User.new}
	let(:nagamura) {Bike.new}

	it 'user does not have a bike initially' do
		expect(bill.bikes.count).to eq 0
	end

	it 'can rent a bike' do
		bill.rent_bike(nagamura)
		expect(bill.bikes).to eq [nagamura]
	end

	it 'can return a bike' do
		bill.rent_bike(nagamura)
		bill.return_bike(nagamura)
		expect(bill.bikes).not_to eq [nagamura]
	end

end