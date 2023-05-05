# Rails.application.routes.draw do
#   devise_for :users
#   root to: "pages#home"
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"

#   resources :mangas
# end

Rails.application.routes.draw do
  devise_for :users

  resources :mangas do
    resources :chapters, shallow: true
    resources :manga_reviews, shallow: true
  end

  resources :bookmarks, only: [:create, :destroy]

  resources :chapter_reviews, only: [:create, :update, :destroy]

  root 'mangas#index'
end
