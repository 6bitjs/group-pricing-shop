class AddAllowPayLaterColumnToSpreeUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_users, :allow_pay_later, :boolean, default: false
  end
end
