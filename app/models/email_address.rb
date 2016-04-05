class EmailAddress < ActiveRecord::Base
	validates :email, :person_id, presence: true
	belongs_to :person
end
