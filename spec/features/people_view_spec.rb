require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'support/omniauth.rb'

describe 'the people view', type: :feature do
	context 'when logged in' do
		let(:user) {Fabricate(:user)}

		it 'displays people associated with user' do
			person1 = Fabricate(:person)
			person1.user = user
			person1.save
			login_as(user)
			visit(people_path)
			expect(page).to have_text(person1.to_s)
		end

		it 'does not display people associated to another user' do
			user2 = Fabricate(:user)
			person2 = Fabricate(:person)
			person2.user = user2
			person2.save
			login_as(user)
			visit(people_path)
			expect(page).to_not have_text(person2.to_s)
		end

	end

end