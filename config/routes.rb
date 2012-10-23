Matebadges::Application.routes.draw do

  devise_for :admins

  authenticate :admin do
    resources :users
    match 'issue' => 'home#index'
    mount BadgesEngine::Engine => '/interface'
  end

  match 'matebadges/:id/:token.json' => 'badge_server#bake_callback', :via => :get, :defaults => { :format => 'json' }, :as => :badge_server
end
