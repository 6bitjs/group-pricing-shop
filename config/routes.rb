Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin, path: Spree.admin_path do

    resources :pricing_groups# do
    #   member do
    #     get :pricing_groups
    #     post :add_pricing_group
    #   end
    # end
    resources :products, only: [] do
      resources :product_prices
    end

  end
end
