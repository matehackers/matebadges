Matebadges::Application.routes.draw do

  devise_for :admins

  authenticate :admin do
    resources :users
    match '/' => 'home#index'
    match '/award' => 'home#award'
    match '/issue' => 'home#issue'
    mount BadgesEngine::Engine => '/interface'
  end

  match 'matebadges/:id/:token' => 'badge_server#bake_callback', :via => :get, :defaults => { :format => 'json' }, :as => :badge_server
end
