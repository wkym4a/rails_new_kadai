Rails.application.routes.draw do

  root 'tops#index'

  resources :lines do

    collection do
      get :confirm
    end

  end

end
