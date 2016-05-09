require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { Fabricate(:user) }

 	it 'has associated people' do
		expect(user.people).to_not be_nil
	end

	it 'builds associated to people' do
		person1 = Fabricate(:person)
		person2 = Fabricate(:person)
		[person1, person2].each do |person|
			expect(user.people).to_not include(person)
			user.people << person
			expect(user.people).to include(person)
		end
	end
	it 'builds associated to company' do
		company1 = Fabricate(:company)
		company2 = Fabricate(:company)
		[company1, company2].each do |company|
			expect(user.companies).to_not include(company)
			user.companies << company
			expect(user.companies).to include(company)
		end
	end
	
end
