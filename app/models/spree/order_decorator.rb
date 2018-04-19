Spree::Order.class_eval do

    def update_line_item_prices!(current_user=nil)
      transaction do
        line_items.each do |line_item|
          line_item.update_price(current_user)
        end
        save!
      end
    end

end
