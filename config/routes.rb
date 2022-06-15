Rails.application.routes.draw do
  resources :posts do
    collection do
      post :confirm
      patch :confirm # confirm後のupdateに必要
    end
  end
end


