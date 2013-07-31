WalmartStore::Application.routes.draw do
  get "main/index"

  root to: "main#index"

  scope "api" do
    resources :products, except: [:new, :edit] do
      collection do
        get 'export'
      end
    end
  end

end
