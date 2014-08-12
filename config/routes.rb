# The generic format is like so:
# HTTPVERB ‘URL’ => 
# “CONTROLLER#VIEW”


Rails.application.routes.draw do 

	#this is a shortcut (aka RESTful route) to create a list of related routes. for example, resources :events creates the following routes: 

resources :users do 
	resources :forums
		resources :posts
end

	get '/' => "home#index"
	get '/home' => "home#index"
	get '/index' => "home#index"
	get '/join' => "home#join"
 	get '/contact' => "home#contact"
 	get '/contact/:id' => "home#contact", as: :contactus
 	get '/success' => "users#contact", as: :success
 	get '/error' => "users#contact", as: :error
 	get '/join' => "users#new"
 	get '/search' => "users#users"
 	get '/login' => "sessions#new"
 	get '/in' => "private#index"
 	get '/sessions' => "session#destroy", as: :logout





resources :sessions, only: ['create','destroy']
end




# #       user_forums GET    /users/:user_id/forums(.:format)          forums#index
#                 POST   /users/:user_id/forums(.:format)          forums#create
#  new_user_forum GET    /users/:user_id/forums/new(.:format)      forums#new
# edit_user_forum GET    /users/:user_id/forums/:id/edit(.:format) forums#edit
#      user_forum GET    /users/:user_id/forums/:id(.:format)      forums#show
#                 PATCH  /users/:user_id/forums/:id(.:format)      forums#update
#                 PUT    /users/:user_id/forums/:id(.:format)      forums#update
#                 DELETE /users/:user_id/forums/:id(.:format)      forums#destroy
#      user_posts GET    /users/:user_id/posts(.:format)           posts#index
#                 POST   /users/:user_id/posts(.:format)           posts#create
#   new_user_post GET    /users/:user_id/posts/new(.:format)       posts#new
#  edit_user_post GET    /users/:user_id/posts/:id/edit(.:format)  posts#edit
#       user_post GET    /users/:user_id/posts/:id(.:format)       posts#show
#                 PATCH  /users/:user_id/posts/:id(.:format)       posts#update
#                 PUT    /users/:user_id/posts/:id(.:format)       posts#update
#                 DELETE /users/:user_id/posts/:id(.:format)       posts#destroy
#           users GET    /users(.:format)                          users#index
#                 POST   /users(.:format)                          users#create
#        new_user GET    /users/new(.:format)                      users#new
#       edit_user GET    /users/:id/edit(.:format)                 users#edit
#            user GET    /users/:id(.:format)                      users#show
#                 PATCH  /users/:id(.:format)                      users#update
#                 PUT    /users/:id(.:format)                      users#update
#                 DELETE /users/:id(.:format)                      users#destroy
#                 GET    /                                         home#index
#            home GET    /home(.:format)                           home#index
#           index GET    /index(.:format)                          home#index
#            join GET    /join(.:format)                           home#join
#         contact GET    /contact(.:format)                        home#contact
#       contactus GET    /contact/:id(.:format)                    home#contact
#         success GET    /success(.:format)                        users#contact
#           error GET    /error(.:format)                          users#contact
#                 GET    /join(.:format)                           users#new
#          search GET    /search(.:format)                         users#users
#           login GET    /login(.:format)                          sessions#new
#              in GET    /in(.:format)                             private#index
#          logout GET    /session(.:format)                        session#destroy
#        sessions POST   /sessions(.:format)                       sessions#create
#         session DELETE /sessions/:id(.:format)                   sessions#destroy