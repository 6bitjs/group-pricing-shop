Spree::BaseHelper.module_eval do

  def display_price(product_or_variant)
    product_or_variant.
      price_in(current_currency).
      display_price_including_vat_for(current_price_options).
      to_html
  end

  def pricing_group_display_price(product_or_variant, currency_icon=true, user=nil)
    price = 0.0
    user = user || spree_current_user
       
    current_currency = Spree::Preference.find_by(key: "spree/app_configuration/currency").value unless current_currency
    if user.try(:pricing_group).present?
      current_user_pricing_group = user.pricing_group
      product_price =  current_user_pricing_group ? 
                        product_or_variant.product_prices.find_by(pricing_group_id: current_user_pricing_group.id) :
                        nil
      if product_price.blank?
        if currency_icon
          price = product_or_variant.price_in(current_currency).display_price_including_vat_for(current_price_options).to_html
        else
          price = product_or_variant.price_in(current_currency).amount.to_f
        end
      else
        if currency_icon
          price = Monetize.parse([product_price.price.to_f, (current_currency || Spree::Config[:currency])].join).format()
        else
          price = product_price.price.to_f
        end
      end
    else
      if currency_icon
        price = product_or_variant.price_in(current_currency).display_price_including_vat_for(current_price_options).to_html
      else
        price = product_or_variant.price_in(current_currency).amount.to_f
      end
    end
    price
  end

  def variant_price_difference(variant)
    price = 0.0
    if spree_current_user.try(:pricing_group).present?
      current_user_pricing_group = spree_current_user.pricing_group
      
      product_price =  current_user_pricing_group ? 
                        variant.product_prices.find_by(pricing_group_id: current_user_pricing_group.id) :
                        nil
      if product_price.blank?
        price = variant.price_in(current_currency).amount.to_f
      else
        price = product_price.price.to_f
      end
    else
      price = variant.price_in(current_currency).amount.to_f
    end
    product_price = pricing_group_display_price(@product, currency_icon=false)

    "(Add: #{(price - product_price).round(2)})"
  end


  def product_price_in_current_currency(product)
    if spree_current_user.try(:pricing_group).present?
      current_user_pricing_group = spree_current_user.pricing_group
      product_prices = product.product_prices
      
      product_price =  current_user_pricing_group ? 
                        product.product_prices.find_by(pricing_group_id: current_user_pricing_group.id) :
                        nil

      if product_price.blank?
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
