Prospects::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users

  root :to => "dashboard#index"

  resources :prospects, :only => [:index, :show]

  namespace :api do
    resources :prospects,      :only => [:show, :update]
    resources :mailgun_events, :only => [:create]
    resources :events,         :only => [:create]
    resources :emails,         :only => [:create]
  end

  namespace :admin do
    get "/prospects/:id" => "old_prospects#show", :as => :prospect
    resources :old_prospects, :only => [:index, :show]
    resources :prospect_assignments, :only => [] do
      collection do
        post :mass_create
      end
    end
    resources :metrics, :only => [:index] do
      collection do
        get :daily_calls
        get :weekly_calls
        get :all_calls
        get :calls_per_day
        get :prospects
        get :prospects_dump
        get :tags
      end
    end
  end
end
