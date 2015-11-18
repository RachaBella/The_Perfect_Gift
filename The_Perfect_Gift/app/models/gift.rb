class Gift < ActiveRecord::Base
	has_many :recipient_gifts
	has_many :recipients, through: :recipient_gifts
end
