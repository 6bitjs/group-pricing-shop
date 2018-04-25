Deface::Override.new(virtual_path: 'spree/admin/users/_form',
  name: 'add_pricing_groups_select_in_admin_user_edit',
  insert_top: "[data-hook='admin_user_form_roles']",
  text: "
    <div class='form-group'>
      <%= f.field_container :pricing_group_id do %>
        <%= label_tag 'pricing_group_id', Spree.t(:pricing_group) %>
        <%= select_tag 'user[pricing_group_id]', options_for_select(@pricing_groups.pluck(:name, :id), @user.pricing_group_id),
          {class: 'select2', value: @user.pricing_group_id} %>
      <% end %>
    </div>
  "
)