# frozen_string_literal: true

class HandleShipping
  attr_reader :checkout_model

  def initialize(checkout_model)
    @checkout_model
  end

  def handle_shipping
    Rails.logger.warn("I need to print a label for #{checkout_model.recipient.address}")
  end
end
