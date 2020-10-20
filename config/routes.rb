
#root
Rails.application.routes.draw do
  root 'rocket_elevator#index'

  get "rocket_elevator/residancial", to "rocket_elevator#residancial"
  get "rocket_elevator/commercial", to "rocket_elevator#commercial"
  get "rocket_elevator/quote", to "rocket_elevator#quote"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


#     root to:'pages#/admin'
#     devise_for :users
#     mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  
#     namespace :api, defaults: {format: :json} do
#       namespace :v1 do 
#         devise_scope :user do
#            #post "sign_up", to: "registrations#/admin"
#             post "sign_in", to: "main#/admin"
#         end
#       end
#     end

end
