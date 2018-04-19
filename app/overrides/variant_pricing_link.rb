Deface::Override.new(virtual_path: 'spree/admin/variants/edit',
  name: 'variant_pricing_link',
  insert_top: "[data-hook='admin_variant_edit_form']",
  text: "
    <li>
      <%= link_to Spree.t(:variant_pricings), admin_product_variant_variant_prices_path(@product, @variant), class: 'btn btn-primary pull-right' %>
    </li>
  "
)