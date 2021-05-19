Rails.application.routes.draw do
  resources :people
  get "welcome/say_hello" => "welcome#say"
  get "welcome" =>"welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  match ':controller(/:action(/:id(.:format)))', :via => :all
end