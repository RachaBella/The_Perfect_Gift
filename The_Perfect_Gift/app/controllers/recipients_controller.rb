class RecipientsController < ApplicationController
	
	def index
		
	end

	def new
		@recipient = Recipient.new
	end

	def create
		p params
		@current_user = current_user
		@recipient = Recipient.create(params.require(:recipient).permit(:name, :email))
		if @recipient.save
			p  "sqved"
			@current_user.recipients << @recipient
			redirect_to root_path
		else
			redirect_to root_path
		end

	end


	private
	def recipients_param
		params.require(:recipient).permit(:name, :email)
	end
end
