class RecipientGift < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :gift
end
