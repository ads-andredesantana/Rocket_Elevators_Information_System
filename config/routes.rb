#root
Rails.application.routes.draw do
  root 'rocket_elevator#index'
  get 'rocket_elevator/residancial'
  get 'rocket_elevator/comercial'
  get 'rocket_elevator/quote'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
