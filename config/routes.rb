Rails.application.routes.draw do
  get 'links/public_link'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'sessions#login'

  resources :users

  patch '/upload', to: 'users#upload'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get '/remove(/:file_id)', to: 'users#remove', as: :remove
  get '/removef(/:folder_id)', to: 'users#removef', as: :removef
  get '/chdir(/:folder_id)', to: 'users#chdir', as: :chdir
  patch '/change_dirname', to: 'users#change_dirname'
  patch '/change_filename', to: 'users#change_filename'
  patch '/create_folder', to: 'users#create_folder'
  get '/public_link(/:link_id)', to: 'links#public_link', as: :public_link
  post '/links', to: 'users#generate_link'
  get '/remove_link(/:link_id)', to: 'links#remove', as: :remove_link

end
