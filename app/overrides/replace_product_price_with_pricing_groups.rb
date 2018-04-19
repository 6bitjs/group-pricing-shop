Deface::Override.new(virtual_path: 'spree/products/_cart_form',
  name: 'replace_product_price_with_pricing_groups',
  replace: "[data-hook='product_price'] .price.selling.lead",
  text: "
    <span class='price selling lead' itemprop='price' content='<%= product_price_in_current_currency(@product) %>'>
      <%= pricing_group_display_price(@product, true) %>
    </span>
  "
)

Deface::Override.new(virtual_path: 'spree/products/_cart_form',
  name: 'replace_variant_price_with_pricing_groups',
  replace: "[data-hook='inside_product_cart_form'] #product-variants ul.list-group",
  text: '
    <ul class="list-group">
      <% @product.variants_and_option_values(current_currency).each_with_index do |variant, index| %>
        <li>
          <%= radio_button_tag "variant_id", variant.id, index == 0,
              "data-price" => product_price_in_current_currency(variant),
              "data-in-stock" => variant.can_supply?
          %>
          <%= label_tag "variant_id_#{ variant.id }" do %>
            <span class="variant-description">
              <%= variant_options variant %>
            </span>
            <% if variant_price variant %>
              <span class="price diff"><%= variant_price_difference variant %></span>
            <% end %>
            <% unless variant.can_supply? %>
              <span class="out-of-stock"><%= Spree.t(:out_of_stock) %></span>
            <% end %>
          <% end %>
        </li>
      <% end%>
    </ul>
  '
)