Rails.application.routes.draw do
  root to: 'sessions#new'

  get 'blogs/top'
  resources:sessions, only: [:new, :create, :destroy]
  resources:users,only:[:new,:create,:show]

  resources:blogs do
    collection do
      post:confirm
    end
  end
end
