class GiftsController < ApplicationController
	
	def index
		@current_user = current_user
		@user = User.friendly.find(params[:user_id])
		@recipients = @user.recipients 
		@recipient = Recipient.find(params[:recipient_id])
		@recipient_gifts = RecipientGift.where("recipient_id= ?" , @recipient.id)
		@occasions_gifts = RecipientGift.select("occasion, gift_id, recipient_id").where("recipient_id= ?" , @recipient.id).group("occasion , gift_id, recipient_id")
		p @occasions_gifts
	end
	def create
		@recipient = Recipient.find(params[:recipient_id])
		@user = User.find(params[:user_id])
		@recipient_gift = RecipientGift.new
		@gift = Gift.create(:name => params["keyword"] , :price => params["price"], :imageUrl => params["imageUrl"] , :link => params["url"] , :description => params["description"])
		if @gift.save
			@recipient_gift = RecipientGift.create(:recipient_id => params["recipient_id"] , :gift_id => @gift.id, :occasion => params["occasion"])
			puts @recipient_gift
			puts @gift
			flash.now[:addedgift] = "Your gift has been saved."
		end

	end
	def show
	end
	def destroy
		user = User.friendly.find(params[:user_id])
		recipient = Recipient.find(params[:recipient_id])
		gift = Gift.find(params[:id])
		gift.destroy
		redirect_to user_recipient_gifts_path(user, recipient)
	end

	def receivedata
		puts params
	end

	
end
