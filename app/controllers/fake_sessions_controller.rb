require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

class FakeSessionsController < ApplicationController
  def create
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end
end

describe 'the application', type: :feature do
  # ...
end
