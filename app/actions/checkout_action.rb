class CheckoutAction
  def checkout(buyer:, recipient:, line_items:, promotions: [])
    ManagePayment.new.manage_payment(buyer, recipient, line_items, promotions)
    Order.create(buyer:, recipient:, line_items:)
  end
end
