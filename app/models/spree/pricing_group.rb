class Spree::PricingGroup < ApplicationRecord
  validates_presence_of :identifier, :name
  validates_uniqueness_of :identifier, :name
  has_many :product_prices
  has_many :users
end
