Spree::Price.class_eval do
  include Spree::BaseHelper  
  def price_including_vat_for(price_options)
    
    if price_options[:spree_current_user]
      group_price = pricing_group_display_price(variant, false, price_options[:spree_current_user])
      options = price_options.merge(tax_category: variant.tax_category)
      gross_amount(group_price, options)
    else
      options = price_options.merge(tax_category: variant.tax_category)
      gross_amount(price, options)
    end
    
  end
end
