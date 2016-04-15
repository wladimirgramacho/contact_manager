require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
	let(:person) { Person.create(first_name: 'Daniels', last_name: 'Mito')}
	let(:email_address) {EmailAddress.new(email: 'wladimirgramacho@gmail.com', contact_id: person.id, contact_type: 'Person')}

	it 'is valid' do
		expect(email_address).to be_valid
	end

	it 'is invalid without email' do
		email_address.email = nil
		expect(email_address).to_not be_valid
	end

	it 'is invalid without contact_id' do
		email_address.contact_id = nil
		expect(email_address).to_not be_valid
	end

	it 'is associated with a contact' do
		expect(email_address).to respond_to(:contact)
	end
end

