Spree::User.class_eval do
  belongs_to :pricing_group

  Spree::PermittedAttributes.user_attributes << :pricing_group_id
end
