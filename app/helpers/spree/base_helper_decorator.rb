Spree::BaseHelper.module_eval do

  def display_price(product_or_variant)
    product_or_variant.
      price_in(current_currency).
      display_price_including_vat_for(current_price_options).
      to_html
  end

  def pricing_group_display_price(product_or_variant, currency_icon=false)
    if spree_current_user.try(:pricing_group).present?
      current_user_pricing_group = spree_current_user.pricing_group
      product_prices = product_or_variant.product_prices
      if product_prices.blank?
        product_or_variant.
        price_in(current_currency).
        display_price_including_vat_for(current_price_options).
        to_html
      else
        product_price = product_or_variant.product_prices.find_by(pricing_group_id: current_user_pricing_group.id)
        Monetize.parse([product_price.price.to_f, (current_currency || Spree::Config[:currency])].join).format()
      end
    else
      product_or_variant.
      price_in(current_currency).
      display_price_including_vat_for(current_price_options).
      to_html
    end
  end


  def product_price_in_current_currency(product)
    if spree_current_user.try(:pricing_group).present?
      current_user_pricing_group = spree_current_user.pricing_group
      product_prices = product.product_prices
      if product_prices.blank?
        product.price_in(current_currency).amount.to_d
      else
        product_price = product.product_prices.find_by(pricing_group_id: current_user_pricing_group.id)
        product_price.try(:price).to_f
      end
    else
      product.price_in(current_currency).amount.to_d
    end
  end

end
