Spree::User.class_eval do

  Spree::PermittedAttributes.user_attributes << :allow_pay_later

end
