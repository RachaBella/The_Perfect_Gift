class User < ActiveRecord::Base
	has_many :recipients
	has_secure_password
	extend FriendlyId
	friendly_id :username, use: :slugged
	validates :email, presence: true, uniqueness: true, length: { minimum: 6 }, format: { with: /[a-z]+(\_?|\.?|\-?)[a-z]*[0-9]*\@[a-z]+\.[a-z]{2,3}|[a-z]*[0-9]*(\_?|\.?|\-?)[a-z]+\@[a-z]+.[a-z]{2,3}/i, on: :create }
	validates :password, presence: true, length:  { minimum: 6}
	def self.confirm(params)
    	@user = User.find_by({email: params[:email]})
    	@user.try(:authenticate, params[:password])
  	end


end
