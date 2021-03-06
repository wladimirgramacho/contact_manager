require 'rails_helper'

RSpec.describe Person, type: :model do
	let(:person) {Fabricate(:person)}

	it 'is invalid without a first name' do
		person.first_name = nil
		expect(person).not_to be_valid
	end

	it 'is invalid without a last name' do
		person.last_name = nil
		expect(person).not_to be_valid
	end

	it 'is valid' do
		expect(person).to be_valid
	end

	it 'responds with its created phone numbers' do
		person.phone_numbers.build(number: '555-0000')
		expect(person.phone_numbers.map(&:number)).to eq(['555-0000'])
	end

	it 'responds with its created email addresses' do
		person.email_addresses.build(email: 'me@example.com')
		expect(person.email_addresses.map(&:email)).to eq(['me@example.com'])
	end

	it "convert to a string with first name last name" do
		expect(person.to_s).to eq "Alice Smith"
	end

	it 'is a child of user' do
		expect(person.user).to be_instance_of(User)
	end


end
