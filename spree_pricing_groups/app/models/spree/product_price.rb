class Spree::ProductPrice < ApplicationRecord
  validates_presence_of :pricing_group_id
  validates_presence_of :price
  belongs_to :pricing_group
end
