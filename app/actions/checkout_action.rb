class CheckoutAction
  def checkout(buyer_or_id:, recipient_or_id:, line_items:, promotions: [])
    promotions = promotions.map { _1.to_sym }
    buyer = Person.from(buyer_or_id)
    recipient = Person.from(recipient_or_id)
    ManagePayment.new.manage_payment(buyer, recipient, line_items, promotions)
    Order.create(buyer:, recipient:, line_items:)
  end
end
