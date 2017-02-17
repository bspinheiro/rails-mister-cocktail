Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]

   # get "doses/:id", to: "doses#select_dose", as: "select_dose"

  root to: "cocktails#index"
end
