class GiftsController < ApplicationController
	
	def index
	end

	def create
		@recipient = Recipient.find(params[:recipient_id])
		@user = User.find(@recipient.user_id)
		p params
	end

	def show
	end

	def destroy
	end

	def receivedata
		puts params
	end

	
end
