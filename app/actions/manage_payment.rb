# frozen_string_literal: true

class ManagePayment
  attr_reader :buyer, :recipient, :line_items, :promotions

  def initialize(buyer, recipient, line_items, promotions)
    @buyer = buyer
    @recipient = recipient
    @line_items = line_items
    @promotions = promotions
  end

  def manage_payment
    Rails.logger.warn("#{buyer.name} is being charged #{total}")
  end

  def total
    sub_total = line_items.sum { _1.cost_in_money }
    tax = line_items.sum { _1.tax_rate_object(buyer).tax }
    sub_total + tax
  end
end
