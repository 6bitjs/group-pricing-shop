class CreateSpreePricingGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_pricing_groups do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end
end
