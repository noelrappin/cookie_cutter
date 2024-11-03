class CheckoutAction
  attr_reader :buyer, :recipient, :line_items, :promotions

  def initialize(buyer:, recipient:, line_items:, promotions: [])
    @buyer = buyer
    @recipient = recipient
    @line_items = line_items
    @promotions = promotions
  end

  def checkout
    ManagePayment.new(buyer, recipient, line_items, promotions).manage_payment
    Order.create(buyer:, recipient:, line_items:)
    HandleShipping.new(recipient, line_items).handle_shipping
  end
end
