Spree::Admin::ProductsController.class_eval do

  def pricing_groups
    @procing_groups = Spree::PricingGroup.all
    session[:return_to] = request.url
    respond_with(@procing_groups)
  end

  def add_pricing_group
    @procing_groups = Spree::PricingGroup.all
    session[:return_to] = request.url
    respond_with(@procing_groups)
  end

end
