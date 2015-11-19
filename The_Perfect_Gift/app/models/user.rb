class User < ActiveRecord::Base
	has_many :recipients
	has_secure_password
	extend FriendlyId
	friendly_id :username, use: :slugged

	def self.confirm(params)
    	@user = User.find_by({email: params[:email]})
    	@user.try(:authenticate, params[:password])
  	end


end
