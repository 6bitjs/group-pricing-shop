Deface::Override.new(virtual_path: 'spree/checkout/_payment',
  name: 'allow_pay_later_payment_methods_checkout',
  replace: "#payment-method-fields",
  text: '
    <ul class="list-group" id="payment-method-fields" data-hook>
      <% @order.available_payment_methods.each do |method| %>
        <% if method.allow_pay_later %>
          <% if spree_current_user.try(:allow_pay_later) %>
            <li class="list-group-item">
              <label>
                <%= radio_button_tag "order[payments_attributes][][payment_method_id]", method.id, method == @order.available_payment_methods.first %>
                <%= Spree.t(method.name, scope: :payment_methods, default: method.name) %>
              </label>
            </li>
          <% end %>
        <% else %>
          <li class="list-group-item">
            <label>
              <%= radio_button_tag "order[payments_attributes][][payment_method_id]", method.id, method == @order.available_payment_methods.first %>
              <%= Spree.t(method.name, scope: :payment_methods, default: method.name) %>
            </label>
          </li>
        <% end %>
      <% end %>
    </ul>
  '
)