Spree::CheckoutController.class_eval do
  before_action :check_allow_pay_later_activated, only: [:edit]

  private
    def check_allow_pay_later_activated
      return if params[:state]!="address"
      if spree_current_user and !spree_current_user.allow_pay_later
        flash[:error] = "Your organization has not been configured for Pay Later payment processing. Please contact your account administrator for support."
      end
    end

end
