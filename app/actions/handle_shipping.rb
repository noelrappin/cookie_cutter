# frozen_string_literal: true

class HandleShipping
  def handle_shipping(recipient, line_items)
    Rails.logger.warn("I need to print a label for #{recipient.address}")
  end
end
