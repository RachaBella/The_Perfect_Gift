class WelcomeController < ApplicationController
	def index
		render :index
	end

	def search_form
		@recipient= Recipient.new
		if @current_user = current_user
			@recipients= @current_user.recipients
			render :search_form
		else  
			flash[:notice] = "Please log in to search"
			redirect_to root_path
		end
	end

	def search
		@current_user = current_user
		@recipient= Recipient.new
		@gift = Gift.new
		@recipients =  @current_user.recipients
		if params[:user]["recipient_id"] =="" || params[:user]["recipient_id"] ==nil
			flash[:notice] = "Please chose the recipient for the gift"
			redirect_to search_form_path and return
		else
			@recipientChosen = Recipient.find(params[:user]["recipient_id"])
		end
	
		@recipient_id= params[:user]["recipient_id"]
		@occasionChosen  = params[:occasion]
		var = params[:keyword]
		puts "keyword is !#{params[:keyword] }!"
		if var.nil? || var.empty? 
			flash[:notice] = "Please enter something into the search field"
			redirect_to search_form_path and return			
		end
		@keywords = var.split(/\W+/)
		res = []
		@finalResponse = []
		varHash = Hash.new 
		@keywords.each do |key|
			url = "http://api.prosperent.com/api/search?api_key=" + ENV['PROS_API_KEY']
			url2 = "&query=" + key + "&limit=25"
			res << HTTParty.get(url + url2)
		end

		res.each do |res|
			body = JSON.parse(res.body)
			body["data"].each do |data|
				varHash = {
					:keyword       => data["keyword"],
					:affiliate_url => data["affiliate_url"],
					:image_url     => data["image_url"],
					:price         => data["price"],
					:description   => data["description"]
				}
				@finalResponse << varHash			
			end
		end
		size = @finalResponse.size
		@finalResponse[0], @finalResponse[size -1], @finalResponse[size/2] = 
		@finalResponse[size -1], @finalResponse[size/2], @finalResponse[0]

		
	end
end
