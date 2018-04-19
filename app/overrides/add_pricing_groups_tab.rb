Deface::Override.new(virtual_path: 'spree/admin/shared/_product_tabs',
  name: 'add_pricing_groups_tab',
  insert_bottom: "[data-hook='admin_product_tabs']",
  text: "
    <li>
      <%= link_to_with_icon 'pricing', Spree.t(:pricing), admin_product_product_prices_path(@product) %>
    </li>
  "
)