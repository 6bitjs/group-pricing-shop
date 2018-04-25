Deface::Override.new(virtual_path: 'spree/admin/payment_methods/_form',
  name: 'add_pay_later_in_admin_payment_method_edit',
  insert_after: "[data-hook='active']",
  text: "
    <strong>Payment Option</strong>
    <div class='form-group'>
      <%#= f.field_container :allow_pay_later do %>
      <div class='checkbox'>
        <%= label_tag 'allow_pay_later' do %>
          <%= f.check_box 'allow_pay_later' %> Allow Pay Later
        <% end %>
      </div>
    </div>
  "
)