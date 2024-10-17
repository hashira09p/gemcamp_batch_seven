Rails.application.routes.draw do
  root 'posts#index'
  # get 'posts/index'

  resources 'posts' do
    resources 'comments'
  end

  namespace :api do
    namespace :v1 do
      resources :regions, only: %i[index show], defaults: { format: :json }
    end
  end
end
