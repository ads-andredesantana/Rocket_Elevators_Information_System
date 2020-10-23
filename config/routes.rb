
#root
Rails.application.routes.draw do
 
  resources :elevators
  resources :columns
  resources :batteries
  resources :building_details
  resources :buildings
  resources :customers
  resources :addresses
  resources :leads
  root 'rocket_elevator#index'
  get '/index', to: 'rocket_elevator#index'
  get "/residancial", to: "rocket_elevator#residancial"
  get "/commercial", to: "rocket_elevator#commercial"
  get "/quote", to: "rocket_elevator#quote"
  get "/news_press1", to: "rocket_elevator#news_press1"
  get "/news_press2", to: "rocket_elevator#news_press2"
  get "/news_press3", to: "rocket_elevator#news_press3"
  get "/news_press4", to: "rocket_elevator#news_press4"
  get "/news_press5", to: "rocket_elevator#news_press5"
  get "/news_press6", to: "rocket_elevator#news_press6"
  get "/portfolio_detail_modal_1.html", to: "rocket_elevators#portfolio_detail_modal_1"

  # get "/login", to: ""

  
#  root to: "home#index"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

       devise_for :users
      mount RailsAdmin::Engine => '/', as: 'rails_admin'
  
  
      namespace :api, defaults: {format: :json} do
        namespace :v1 do 
           devise_scope :user do
              #post "sign_up", to: "registrations#/admin"
               post "sign_in", to: "main#/admin"
           end
         end
       end
end