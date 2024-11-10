# frozen_string_literal: true

class HandleShipping
  attr_reader :recipient, :line_items

  def initialize(recipient, line_items)
    @recipient = recipient
    @line_items = line_items
  end

  def handle_shipping
    case recipient.preferred_shipping_type
    when "ups_Ground"
      p "Preparing a UPS ground label for #{recipient.address}"
    when "usps"
      p "Preparing a USPS ground label for #{recipient.address}"
    when "po_box"
      p "Alert that this may have delivery problems for #{recipient.address} "
    end
  end
end
