require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'



describe 'the application', type: :feature do

	context 'when logged out' do
		before(:each) do
		  visit root_path
		end

	    it 'has a login link' do
	      expect(page).to have_link('Login', href: login_path)
	    end

	    it 'does not link to logout' do
    	  expect(page).not_to have_link('Logout', href: logout_path)
	    end
    end

    context 'when logged in' do
	    before(:each) do
		    Rails.application.routes.draw do
			    root to: 'site#index'
			    get '/fake_login' => 'fake_sessions#create', as: :fake_login
			    get '/login' => redirect('/auth/twitter'), as: :login
			    delete "/logout" => "sessions#destroy", as: :logout
		    end
		    user = User.create(name: 'Jane Doe')
		    visit fake_login_path(:user_id => user.id)
		end

		after(:each) do
			Rails.application.reload_routes!
		end

		it 'has a logout link' do
			expect(page).to have_link('Logout', href: logout_path)
		end

		it 'does not have a login link' do
			expect(page).not_to have_link('Login', href: login_path)
		end


    end
  

end
