Rails.application.routes.draw do
  devise_for :organizers, :controllers => { registrations: 'registrations' },
    :path => '', :path_names => {
      :sign_in => 'login',
      :sign_out => 'logout',
      :sign_up => 'signup'
    }

  root 'welcome#index'
  resources :events do
    get 'schedule', on: :member
    get 'app', on: :member
    get 'build', on: :member
  end
  resources :schedules
  resources :updates
  resources :prizes
  resources :people
end
