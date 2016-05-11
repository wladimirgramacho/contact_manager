require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'support/omniauth.rb'

describe 'the company view', type: :feature do
	context 'when logged in' do
		let(:user) {Fabricate(:user)}

		it 'displays companies associated with user' do
			company1 = Fabricate(:company)
			company1.user = user
			company1.save
			login_as(user)
			visit(companies_path)
			expect(page).to have_text(company1.to_s)
		end

		it 'does not display companies associated to another user' do
			user2 = Fabricate(:user)
			company2 = Fabricate(:company)
			company2.user = user2
			company2.save
			login_as(user)
			visit(companies_path)
			expect(page).to_not have_text(company2.to_s)
		end

	end

end