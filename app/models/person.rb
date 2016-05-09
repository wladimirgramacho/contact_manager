class Person < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	include Contact
	belongs_to :user
	def to_s
		"#{first_name} #{last_name}"		
	end
end
