# frozen_string_literal: true

class HandleShipping
  attr_reader :recipient, :line_items

  def initialize(recipient, line_items)
    @recipient = recipient
    @line_items = line_items
  end

  def handle_shipping
    Rails.logger.warn("I need to print a label for #{recipient.address}")
  end
end
