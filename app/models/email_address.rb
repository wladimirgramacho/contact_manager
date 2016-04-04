class EmailAddress < ActiveRecord::Base
	validates :email, presence: true
	belongs_to :person
end
