Spree::LineItem.class_eval do
  
  def update_price(spree_current_user=nil)
    self.price = variant.price_including_vat_for(tax_zone: tax_zone, spree_current_user: spree_current_user)
  end


end
