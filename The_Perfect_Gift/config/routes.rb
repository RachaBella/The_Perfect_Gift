Rails.application.routes.draw do
  
  resources :users do 
    resources :recipents do 
      resources :gifts do 
      end
    end
  end 
  resources :gifts do 
  end

end
