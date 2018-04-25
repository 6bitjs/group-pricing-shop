class CreateSpreeProductPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_product_prices do |t|
      t.integer :product_id
      t.integer :pricing_group_id
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
