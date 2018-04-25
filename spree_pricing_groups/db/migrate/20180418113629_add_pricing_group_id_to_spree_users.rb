class AddPricingGroupIdToSpreeUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_users, :pricing_group_id, :integer
  end
end
