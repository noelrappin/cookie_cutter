# frozen_string_literal: true

class ManagePayment
  attr_reader :checkout_model

  def initialize(checkout_model)
    @checkout_model = checkout_model
  end

  def manage_payment
    Rails.logger.warn("#{buyer.name} is being charged #{checkout_model.total}")
  end
end
