class UserMailer < ApplicationMailer
	default from: "theperfectgift37@gmail.com"

	def welcome_email(user)
		@user = user
	    @url  = 'http://www.google.com'
	    mail(to: @user.email, subject: 'Welcome to The Perfect Gift')
  	end
end

