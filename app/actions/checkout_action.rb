class CheckoutAction < Literal::Object
  prop :buyer, Person, reader: :public
  prop :recipient, Person, reader: :public
  prop :line_items, _Array(LineItem), reader: :public
  prop :promotions, _Array(Symbol), reader: :public

  def checkout
    ManagePayment.new(buyer, recipient, line_items, promotions).manage_payment
    HandleShipping.new(recipient:, line_items:).handle_shipping
    Order.create(buyer:, recipient:, line_items:)
  end
end
