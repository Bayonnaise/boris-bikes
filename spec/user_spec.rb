require 'user'
require 'bike'
require 'docking_station'

describe User do
	let(:bill) {User.new}
	let(:nagamura) {Bike.new}
	let(:old_street) {DockingStation.new}

	it 'user does not have a bike initially' do
		expect(bill.bikes.count).to eq 0
	end

	it 'can rent a bike' do
		old_street.dock(nagamura)
		bill.rent_bike(nagamura, old_street)
		expect(bill.bikes).to eq [nagamura]
		expect(old_street.bikes.count).to eq 0
	end

	it 'can return a bike' do
		old_street.dock(nagamura)
		bill.rent_bike(nagamura, old_street)
		bill.return_bike(nagamura, old_street)
		expect(bill.bikes).not_to eq [nagamura]
		expect(old_street.bikes.count).to eq 1
	end

	it 'can break a bike' do
		old_street.dock(nagamura)
		bill.rent_bike(nagamura, old_street)
		bill.break_bike(nagamura)
		expect(nagamura.broken?).to eq true
	end

end