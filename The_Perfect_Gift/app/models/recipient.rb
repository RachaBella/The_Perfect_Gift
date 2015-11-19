class Recipient < ActiveRecord::Base
	belongs_to :user
	has_many :recipient_gifts
	has_many :gifts , through: :recipient_gifts
	validates :name, presence: true
end
