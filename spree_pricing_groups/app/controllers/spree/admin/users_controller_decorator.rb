Spree::Admin::UsersController.class_eval do
  before_action :fetch_pricing_groups, only: [:new, :created, :edit, :update]

  private
    def fetch_pricing_groups
      @pricing_groups = Spree::PricingGroup.all
    end
end
