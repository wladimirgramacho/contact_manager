class EmailAddress < ActiveRecord::Base
	validates :email, :contact_id, presence: true
	belongs_to :contact, polymorphic: true
end
