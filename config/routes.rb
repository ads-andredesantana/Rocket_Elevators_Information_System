
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
  get 'rocket_elevator/login'
  get 'rocket_elevator/residancial'
  get 'rocket_elevator/commercial'
  get 'rocket_elevator/quote'
  

       devise_for :users
       mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  
      namespace :api, defaults: {format: :json} do
        namespace :v1 do 
           devise_scope :user do
              #post "sign_up", to: "registrations#/admin"
               post "sign_in", to: "main#/admin"
           end
         end
       end
end