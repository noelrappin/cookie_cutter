class CheckoutAction
  attr_reader :checkout_model, :success

  def initialize(checkout_model)
    @checkout_model = checkout_model
    @success = false
  end

  def checkout
    ManagePayment.new(checkout_model).manage_payment
    checkout_model.create_order
    HandleShipping.new(checkout_model).handle_shipping
    @success = true
  end
end
