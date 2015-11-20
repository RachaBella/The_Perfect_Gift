class WelcomeController < ApplicationController
	def index
		@current_user = current_user
		render :index
		
	end
	def search_form
		@current_user = current_user
		render :search_form
	end
	def search
		@current_user = current_user
		@recipient= Recipient.new
		# Walmart - mediorce
		#url = 'http://api.walmartlabs.com/v1/search?query='
		var = params[:keyword]
		@keywords = var.split(/\W+/)
		res = []
		@finalResponse = []
		varHash = Hash.new 
		#restUrl = @searchword +'&format=json&apiKey='+ APP_CONFIG['WAL_API_KEY']
		# Prosperent - good!
		@keywords.each do |key|
			url = "http://api.prosperent.com/api/search?api_key=" + APP_CONFIG['PROS_API_KEY']
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


		# Shoppable - idk yet
		# "http://api.shoppable.com/v1/token/QTKjF6dJrYC3NOwE2498831069e1b964/catalog/?search=shoes&rows=20&offset=0"
		# url = "http://api.shoppable.com/v1/token/" + APP_CONFIG['SHOPP_API_KEY']
		# url2 = "/catalog/?search=" + @searchword

		# "http://api.prosperent.com/api/search?api_key=<YOUR_API_KEY>&query=shoes&filterMerchant=6pm.com"
	end
end
