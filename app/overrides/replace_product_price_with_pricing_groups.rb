Deface::Override.new(virtual_path: 'spree/products/_cart_form',
  name: 'replace_product_price_with_pricing_groups',
  replace: "[data-hook='product_price'] .price.selling.lead",
  text: "
    <span class='price selling lead' itemprop='price' content='<%= product_price_in_current_currency(@product) %>'>
      <%= pricing_group_display_price(@product, true) %>
    </span>
  "
)