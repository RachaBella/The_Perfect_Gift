class LayoutsController < ApplicationController
	def aboutus
		@current_user = current_user
		render :aboutus
	end
end
