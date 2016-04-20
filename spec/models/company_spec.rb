require 'rails_helper'

RSpec.describe Company, type: :model do
	let(:company) { Company.new(name:'Apple')}

	it 'is valid' do
		expect(company).to be_valid
	end

	it 'is invalid' do
		company.name = nil
		expect(company).to_not be_valid
	end

	it "responds with its phone numbers after they're created"  do
		phone_number = company.phone_numbers.build(number: '555-0001')
		expect(phone_number.number).to eq('555-0001')
	end

	it 'responds with its created email addresses' do
		company.email_addresses.build(email: 'me@example.com')
		expect(company.email_addresses.map(&:email)).to eq(['me@example.com'])
	end

	it "convert to a string with name" do
		expect(company.to_s).to eq "Apple"
	end

end
