class WelcomeController < ApplicationController
	def index
		render :index
		
	end
	def search
		#@current_user = current_user

		# Walmart - mediorce
		#url = 'http://api.walmartlabs.com/v1/search?query='
		var = params[:keywords]
		@keywords = var.split(/\W+/)
		@res = []
		#restUrl = @searchword +'&format=json&apiKey='+ APP_CONFIG['WAL_API_KEY']
		# Prosperent - good!
		@keywords.each do |key|
			url = "http://api.prosperent.com/api/search?api_key=" + APP_CONFIG['PROS_API_KEY']
			url2 = "&query=" + key
			@res << HTTParty.get(url + url2)
		end


		# Shoppable - idk yet
		# "http://api.shoppable.com/v1/token/QTKjF6dJrYC3NOwE2498831069e1b964/catalog/?search=shoes&rows=20&offset=0"
		# url = "http://api.shoppable.com/v1/token/" + APP_CONFIG['SHOPP_API_KEY']
		# url2 = "/catalog/?search=" + @searchword

		# "http://api.prosperent.com/api/search?api_key=<YOUR_API_KEY>&query=shoes&filterMerchant=6pm.com"
	end
end
