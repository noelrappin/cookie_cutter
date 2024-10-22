class CheckoutAction
  extend T::Sig

  sig do
    params(
      buyer: Person,
      recipient: Person,
      line_items: T::Array[LineItem],
      promotions: T::Array[String]
    ).void
  end
  def checkout(buyer:, recipient:, line_items:, promotions: [])
    ManagePayment.new.manage_payment(buyer, recipient, line_items, promotions)
    Order.create(buyer:, recipient:, line_items:)
  end
end
