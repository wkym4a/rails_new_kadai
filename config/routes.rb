Rails.application.routes.draw do

  root 'tops#index'

  resources :lines

  resources :lines do
    
    collection do
      post :confirm
    end

  end

end
