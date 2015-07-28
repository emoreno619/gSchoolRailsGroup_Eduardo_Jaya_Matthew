Rails.application.routes.draw do

  resources :users do
    resources :locations
    resources :foods
  end
 

 resources :locations
 resources :foods

 #             Prefix Verb   URI Pattern                                  Controller#Action
 ##     user_locations GET    /users/:user_id/locations(.:format)          locations#index
 ##                    POST   /users/:user_id/locations(.:format)          locations#create
 ##  new_user_location GET    /users/:user_id/locations/new(.:format)      locations#new
 ## edit_user_location GET    /users/:user_id/locations/:id/edit(.:format) locations#edit
 ##      user_location GET    /users/:user_id/locations/:id(.:format)      locations#show
 ##                    PATCH  /users/:user_id/locations/:id(.:format)      locations#update
 ##                    PUT    /users/:user_id/locations/:id(.:format)      locations#update
 ##                    DELETE /users/:user_id/locations/:id(.:format)      locations#destroy
 #         user_foods GET    /users/:user_id/foods(.:format)              foods#index
 #                    POST   /users/:user_id/foods(.:format)              foods#create
 #      new_user_food GET    /users/:user_id/foods/new(.:format)          foods#new
 #     edit_user_food GET    /users/:user_id/foods/:id/edit(.:format)     foods#edit
 #          user_food GET    /users/:user_id/foods/:id(.:format)          foods#show
 #                    PATCH  /users/:user_id/foods/:id(.:format)          foods#update
 #                    PUT    /users/:user_id/foods/:id(.:format)          foods#update
 #                    DELETE /users/:user_id/foods/:id(.:format)          foods#destroy
 #              users GET    /users(.:format)                             users#index
 #                    POST   /users(.:format)                             users#create
 #           new_user GET    /users/new(.:format)                         users#new
 #          edit_user GET    /users/:id/edit(.:format)                    users#edit
 #               user GET    /users/:id(.:format)                         users#show
 #                    PATCH  /users/:id(.:format)                         users#update
 #                    PUT    /users/:id(.:format)                         users#update
 #                    DELETE /users/:id(.:format)                         users#destroy
 ##          locations GET    /locations(.:format)                         locations#index
 ##                    POST   /locations(.:format)                         locations#create
 ##       new_location GET    /locations/new(.:format)                     locations#new
 ##      edit_location GET    /locations/:id/edit(.:format)                locations#edit
 ##           location GET    /locations/:id(.:format)                     locations#show
 ##                    PATCH  /locations/:id(.:format)                     locations#update
 ##                    PUT    /locations/:id(.:format)                     locations#update
 ##                    DELETE /locations/:id(.:format)                     locations#destroy
 #              foods GET    /foods(.:format)                             foods#index
 #                    POST   /foods(.:format)                             foods#create
 #           new_food GET    /foods/new(.:format)                         foods#new
 #          edit_food GET    /foods/:id/edit(.:format)                    foods#edit
 #               food GET    /foods/:id(.:format)                         foods#show
 #                    PATCH  /foods/:id(.:format)                         foods#update
 #                    PUT    /foods/:id(.:format)                         foods#update

 end
