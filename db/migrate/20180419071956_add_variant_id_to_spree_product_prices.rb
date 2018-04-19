class AddVariantIdToSpreeProductPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_product_prices, :variant_id, :integer
  end
end
