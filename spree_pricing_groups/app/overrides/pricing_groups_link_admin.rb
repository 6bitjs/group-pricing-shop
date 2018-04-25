Deface::Override.new(virtual_path: 'spree/admin/shared/sub_menu/_product',
  name: 'pricing_groups_link_admin',
  insert_bottom: "[data-hook='admin_product_sub_tabs']",
  text: "
    <%= tab :pricing_groups, match_path: '/admin/pricing_groups' %>
  "
)