Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      post "graphql", to: "graphql#execute"
      get 'users/:email', to: 'users#show', constraints: { email: /[^\/]+/ }, as: 'show_user_wemail'
      patch 'users/:email', to: 'users#update', constraints: { email: /[^\/]+/ }, as: 'update_user_wemail'
      get 'users/:email/edit', to: 'users#edit', constraints: { email: /[^\/]+/ }, as: 'edit_user_wemail'
      delete 'users/:email', to: 'users#destroy', constraints: { email: /[^\/]+/ }, as: 'destroy_user_wemail'
      post 'users', to: 'users#create', as: 'create_user'

      resources :api_keys, path: 'api-keys', only: %i[index create destroy]
      post 'friendship_tokens/show', to: 'friendship_tokens#show', as: 'show'
      post 'friendship_tokens/add', to: 'friendship_tokens#add', as: 'add'
      post 'users/busqueda', to: 'users#busqueda', as: 'busqueda'
      post 'users/cambiar_avatar', to: 'users#cambiar_avatar', as: 'cambiar_avatar'
      post 'posts/imagenes', to: 'posts#imagenes', as: 'imagenes'
      post 'posts/cargar', to: 'posts#cargar', as: 'cargar'


      resources :trip_destinations
     

      resources :trips, shallow: true do
        resources :posts, shallow: true
        resources :destinations
        resources :users
      end
      
      resources :posts do
        resources :destinations
      end

      resources :destinations
      resources :posts
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
