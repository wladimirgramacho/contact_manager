require 'rails_helper'

describe 'the person view', type: :feature do
	let(:person) {Person.create(first_name: 'John', last_name: 'What')}

	describe '' do #phone numbers

		before(:each) do
			person.phone_numbers.create(number: '555-1234')
			person.phone_numbers.create(number: '555-1334')
			visit person_path(person)
		end

		it 'shows the phone numbers' do
			person.phone_numbers.each do |phone|
				expect(page). to have_content(phone.number)
			end
		end

		it 'has a link to add a phone number' do
			expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: person.id, contact_type: 'Person'))
		end

		it 'has links to edit phone number' do
			person.phone_numbers.each do |phone|
				expect(page).to have_link('edit', href: edit_phone_number_path(phone))
			end
		end

		it 'has links to delete phone number' do
			person.phone_numbers.each do |phone|
			expect(page).to have_link('delete', href: phone_number_path(phone))
			end
		end

		it 'ensures phone number is destroyed entirely' do
			phone = person.phone_numbers.first

			first(:link, 'delete').click
			expect(current_path).to eq(person_path(person))
			expect(page).to_not have_content(phone)
		end

		it 'edits a phone number' do
			phone = person.phone_numbers.first
			old_number = phone.number

			first(:link, 'edit').click
			page.fill_in('Number', with: '555-2234')
			page.click_button('Update Phone number')
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content('555-2234')
			expect(page).to_not have_content(old_number)
		end
		
		it 'adds a phone number and return to person show' do
			page.click_link('Add phone number')
			page.fill_in('Number', with: '555-8888')
			page.click_button('Create Phone number')
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content('555-8888')
		end
	end

	describe '' do # email addresses
		before(:each) do
			person.email_addresses.create(email: 'antonio@gmail.com')
			person.email_addresses.create(email: 'cazalberto@gmail.com')
			visit person_path(person)
		end

		it 'has a li for each email address' do
			expect(page).to have_selector('li', text: 'antonio@gmail.com')
		end

		it 'has an add email address link' do
			expect(page).to have_link('Add email address', href: new_email_address_path(contact_id:person.id, contact_type: 'Person'))
			page.click_link('Add email address')
			expect(current_path).to eq(new_email_address_path)
		end

		it 'has links to edit email address' do
			person.email_addresses.each do |address|
				expect(page).to have_link('edit', href: edit_email_address_path(address))
			end
		end

		it 'has links to delete email address' do
			person.email_addresses.each do |address|
			expect(page).to have_link('delete', href: email_address_path(address))
			end
		end

		it 'ensures email address is destroyed entirely' do
			address = person.email_addresses.first

			first(:link, 'delete').click
			expect(current_path).to eq(person_path(person))
			expect(page).to_not have_content(address)
		end

		it 'edits an email address' do
			address = person.email_addresses.first
			old_address = address.email

			first(:link, 'edit').click
			page.fill_in('Email', with: 'foobar')
			page.click_button('Update Email address')
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content('foobar')
			expect(page).to_not have_content(old_address)
		end

		it 'adds an email address and returns to person show' do
			page.click_link('Add email address')
			page.fill_in('Email', with: 'antonio1@gmail.com')
			page.click_button('Create Email address')
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content('antonio1@gmail.com')
		end



	end

end