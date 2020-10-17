

Rails.application.routes.draw do
  root 'rocket_elevator#index'

  get 'rocket_elevator/residancial'
  get 'rocket_elevator/comercial'
  get 'rocket_elevator/quote'
  # root to:'pages#/admin'
  # devise_for :users
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # root to:'pages#/admin'
  # root to:'pages#index_residential'
  # root to:'pages#index_commercial'

  # namespace :api, defaults: {format: :json} do
  #   namespace :v1 do 
  #     devise_scope :user do
  #        #post "sign_up", to: "registrations#/admin"
  #         post "sign_in", to: "main#/admin"
  #     end
  #   end
  # end
    end