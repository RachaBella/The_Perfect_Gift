class RecipientsController < ApplicationController
	
	def index
		@recipients = User.find(params[:user_id]).recipients
		p @recipients
	end

	def new
		@recipient = Recipient.new
	end

	def create
		p params
		@current_user = current_user
		@recipient = Recipient.create(:name => params["name"], :email => params["email"])
		if @recipient.save
			p  "saved"
			@current_user.recipients << @recipient
			@recipients = @current_user.recipients
			if request.xhr?
			render :json => {
                            :recipient => @recipient
                        }
            end
		else
			redirect_to root_path
		end
	end


	private
	def recipients_param
		params.require(:recipient).permit(:name, :email)
	end
end
