# frozen_string_literal: true

class ManagePayment
  def manage_payment(buyer, recipient, line_items, promotions)
    total = line_items.sum { _1.cost_in_money }
    Rails.logger.warn("#{buyer.name} is being charged #{total}")
    HandleShipping.new.handle_shipping(recipient, line_items)
  end
end
