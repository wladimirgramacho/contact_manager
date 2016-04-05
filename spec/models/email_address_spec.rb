require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
	let(:email_address) {EmailAddress.new(email: 'wladimirgramacho@gmail.com', person_id: 1)}

	it 'is valid' do
		expect(email_address).to be_valid
	end

	it 'is invalid without email' do
		email_address.email = nil
		expect(email_address).to_not be_valid
	end

	it 'is invalid without person_id' do
		email_address.person_id = nil
		expect(email_address).to_not be_valid
	end
end
