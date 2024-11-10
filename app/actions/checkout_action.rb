class CheckoutAction
  attr_reader :buyer, :recipient, :line_items, :promotions

  def initialize(buyer:, recipient:, line_items:, promotions: [])
    @buyer = Person.role_person(buyer, "buyer")
    @recipient = Person.role_person(recipient, "recipient")
    @line_items = line_items
    @promotions = promotions
  end

  def checkout
    buyer.log_identity
    recipient.log_identity
    return if buyer.nillish? || recipient.nillish?
    Order.create(buyer: buyer.person, recipient: recipient.person, line_items:)
    ManagePayment.new(buyer, recipient, line_items, promotions).manage_payment
    HandleShipping.new(recipient, line_items).handle_shipping
  end
end
