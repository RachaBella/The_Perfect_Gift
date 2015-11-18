class WelcomeController < ApplicationController
	def index
		render :index
		
	end
	def search
		#@current_user = current_user
		url = 'http://api.walmartlabs.com/v1/search?query='
		@searchword = params[:keyword]
		restUrl = '&format=json&apiKey='+ APP_CONFIG['API_KEY']
		@res = HTTParty.get(url+@searchword+restUrl)

	end
end
