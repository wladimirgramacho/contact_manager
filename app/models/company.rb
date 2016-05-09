class Company < ActiveRecord::Base
	validates :name, presence: true
	include Contact
	belongs_to :user
	def to_s
		"#{name}"		
	end
end
