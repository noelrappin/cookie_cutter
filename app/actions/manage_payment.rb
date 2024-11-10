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
    result = sub_total
    tax = case buyer.tax_status
    when "us_taxable"
      line_items.sum { _1.us_tax_rate(buyer) }
    when "ca_taxable"
      line_items.sum { _1.ca_tax_rate(buyer) }
    else
      0
    end
    result + tax
  end
end
