class Gift < ActiveRecord::Base
	has_many :recipient_gifts, dependent: :destroy
	has_many :recipients, through: :recipient_gifts
end
