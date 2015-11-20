Rails.application.routes.draw do
  
	root to: 'welcome#index'

	get "/aboutus", to: "layouts#aboutus", as: "aboutus"

	get '/search', to: "welcome#search", as: "search"

	get '/search_form', to: "welcome#search_form", as: "search_form"

	get "/signup", to: "users#new", as: "new_user"
	# #sign in user page
	get "/login", to: "sessions#new"
	#sign in route
	post "/sessions", to: "sessions#create"

	post "/logout" => "sessions#destroy"

	resources :users do
		resources :recipents do 
			resources :gifts 
		end
	end

end


#                  Prefix Verb   URI Pattern                                                     Controller#Action
#                    root GET    /                                                               welcome#index
#                 aboutus GET    /aboutus(.:format)                                              layouts#aboutus
#                  search GET    /search(.:format)                                               welcome#search
#             search_form GET    /search_form(.:format)                                          welcome#search_form
#                new_user GET    /signup(.:format)                                               users#new
#                   login GET    /login(.:format)                                                sessions#new
#                sessions POST   /sessions(.:format)                                             sessions#create
#                  logout POST   /logout(.:format)                                               sessions#destroy
#     user_recipent_gifts GET    /users/:user_id/recipents/:recipent_id/gifts(.:format)          gifts#index
#                         POST   /users/:user_id/recipents/:recipent_id/gifts(.:format)          gifts#create
#  new_user_recipent_gift GET    /users/:user_id/recipents/:recipent_id/gifts/new(.:format)      gifts#new
# edit_user_recipent_gift GET    /users/:user_id/recipents/:recipent_id/gifts/:id/edit(.:format) gifts#edit
#      user_recipent_gift GET    /users/:user_id/recipents/:recipent_id/gifts/:id(.:format)      gifts#show
#                         PATCH  /users/:user_id/recipents/:recipent_id/gifts/:id(.:format)      gifts#update
#                         PUT    /users/:user_id/recipents/:recipent_id/gifts/:id(.:format)      gifts#update
#                         DELETE /users/:user_id/recipents/:recipent_id/gifts/:id(.:format)      gifts#destroy
#          user_recipents GET    /users/:user_id/recipents(.:format)                             recipents#index
#                         POST   /users/:user_id/recipents(.:format)                             recipents#create
#       new_user_recipent GET    /users/:user_id/recipents/new(.:format)                         recipents#new
#      edit_user_recipent GET    /users/:user_id/recipents/:id/edit(.:format)                    recipents#edit
#           user_recipent GET    /users/:user_id/recipents/:id(.:format)                         recipents#show
#                         PATCH  /users/:user_id/recipents/:id(.:format)                         recipents#update
#                         PUT    /users/:user_id/recipents/:id(.:format)                         recipents#update
#                         DELETE /users/:user_id/recipents/:id(.:format)                         recipents#destroy
#                   users GET    /users(.:format)                                                users#index
#                         POST   /users(.:format)                                                users#create
#                         GET    /users/new(.:format)                                            users#new
#               edit_user GET    /users/:id/edit(.:format)                                       users#edit
#                    user GET    /users/:id(.:format)                                            users#show
#                         PATCH  /users/:id(.:format)                                            users#update
#                         PUT    /users/:id(.:format)                                            users#update
#                         DELETE /users/:id(.:format)                                            users#destroy




