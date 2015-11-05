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
    get 'updates', on: :member
    get 'mentors', on: :member
    get 'prizes', on: :member
    get 'app', on: :member
    get 'build', on: :member
    get 'fgstyle', on: :member
    get 'bgstyle', on: :member
  end
  resources :schedules
  resources :updates
  resources :prizes
  resources :people
end
