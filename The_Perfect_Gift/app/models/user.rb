class User < ActiveRecord::Base
	has_many :recipients
end
