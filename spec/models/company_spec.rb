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

end
