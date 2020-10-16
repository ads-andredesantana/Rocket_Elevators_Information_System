Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'pages/index_residential', to: 'pages#index_residential'
  get 'index_residential', to: 'pages#index_residential'

  get 'pages/index_commercial', to: 'pages#index_commercial'
  get 'index_commercial', to: 'pages#index_commercial'

  get 'pages/quotation', to: 'pages#quotation'
  get 'quotation', to: 'pages#quotation'



end
