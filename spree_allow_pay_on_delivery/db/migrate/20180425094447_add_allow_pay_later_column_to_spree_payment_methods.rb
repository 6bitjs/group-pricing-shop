class AddAllowPayLaterColumnToSpreePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_payment_methods, :allow_pay_later, :boolean, default: false
  end
end
