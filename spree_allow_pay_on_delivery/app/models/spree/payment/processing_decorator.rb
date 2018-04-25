Spree::Payment::Processing.module_eval do

  def process!
    if payment_method && payment_method.allow_pay_later and order.user.try(:allow_pay_later)
      authorize!
    elsif payment_method && payment_method.auto_capture?
      purchase!
    else
      authorize!
    end
  end

end
