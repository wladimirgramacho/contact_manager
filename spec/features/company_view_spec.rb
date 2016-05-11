require 'rails_helper'

describe 'the company view', type: :feature do
	let(:company) { Fabricate(:company)}
	let(:user) { company.user}

	describe 'phone numbers' do #phone numbers

		before(:each) do
			company.phone_numbers.create(number: '555-1234')
			company.phone_numbers.create(number: '555-1334')
			login_as(user)
			visit company_path(company)
		end

		it 'shows the phone numbers' do
			company.phone_numbers.each do |phone|
				expect(page). to have_content(phone.number)
			end
		end

		it 'has a link to add a phone number' do
			expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
		end

		it 'has links to edit phone number' do
			company.phone_numbers.each do |phone|
				expect(page).to have_link('edit', href: edit_phone_number_path(phone))
			end
		end

		it 'has links to delete phone number' do
			company.phone_numbers.each do |phone|
			expect(page).to have_link('delete', href: phone_number_path(phone))
			end
		end

		it 'ensures phone number is destroyed entirely' do
			phone = company.phone_numbers.first

			first(:link, 'delete').click
			expect(current_path).to eq(company_path(company))
			expect(page).to_not have_content(phone)
		end

		it 'edits a phone number' do
			phone = company.phone_numbers.first
			old_number = phone.number

			first(:link, 'edit').click
			page.fill_in('Number', with: '555-2234')
			page.click_button('Update Phone number')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('555-2234')
			expect(page).to_not have_content(old_number)
		end
		
		it 'adds a phone number and return to company show' do
			page.click_link('Add phone number')
			page.fill_in('Number', with: '555-8888')
			page.click_button('Create Phone number')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('555-8888')
		end
	end

	describe '' do # email addresses
		before(:each) do
			company.email_addresses.create(email: 'antonio@gmail.com')
			company.email_addresses.create(email: 'cazalberto@gmail.com')
			login_as(user)
			visit company_path(company)
		end

		it 'has a li for each email address' do
			expect(page).to have_selector('li', text: 'antonio@gmail.com')
		end

		it 'has an add email address link' do
			expect(page).to have_link('Add email address', href: new_email_address_path(contact_id:company.id, contact_type: 'Company'))
			page.click_link('Add email address')
			expect(current_path).to eq(new_email_address_path)
		end

		it 'has links to edit email address' do
			company.email_addresses.each do |address|
				expect(page).to have_link('edit', href: edit_email_address_path(address))
			end
		end

		it 'has links to delete email address' do
			company.email_addresses.each do |address|
			expect(page).to have_link('delete', href: email_address_path(address))
			end
		end

		it 'ensures email address is destroyed entirely' do
			address = company.email_addresses.first

			first(:link, 'delete').click
			expect(current_path).to eq(company_path(company))
			expect(page).to_not have_content(address)
		end

		it 'edits an email address' do
			address = company.email_addresses.first
			old_address = address.email

			first(:link, 'edit').click
			page.fill_in('Email', with: 'foobar')
			page.click_button('Update Email address')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('foobar')
			expect(page).to_not have_content(old_address)
		end

		it 'adds an email address and returns to company show' do
			page.click_link('Add email address')
			page.fill_in('Email', with: 'antonio1@gmail.com')
			page.click_button('Create Email address')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('antonio1@gmail.com')
		end
	end

end