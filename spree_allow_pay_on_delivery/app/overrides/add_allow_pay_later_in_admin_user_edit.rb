Deface::Override.new(virtual_path: 'spree/admin/users/_form',
  name: 'add_allow_pay_later_in_admin_user_edit',
  insert_bottom: "[data-hook='admin_user_form_roles']",
  text: "
    <strong>Payment Option</strong>
    <div class='form-group'>
      <%#= f.field_container :allow_pay_later do %>
      <div class='checkbox'>
        <%= label_tag 'allow_pay_later' do %>
          <%= f.check_box 'allow_pay_later' %> Allow_Pay Later
        <% end %>
      </div>
    </div>
  "
)