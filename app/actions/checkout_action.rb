class CheckoutAction
  attr_reader :buyer, :recipient, :line_items, :promotions

  def initialize(buyer:, recipient:, line_items:, promotions: [])
    @buyer = buyer
    @recipient = recipient
    @line_items = line_items
    @promotions = promotions
  end

  def checkout
    if buyer.nil?
      Rails.logger.warn("There is no buyer")
      return
    end
    if recipient.nil?
      Rails.logger.warn("There is no recipient")
      return
    end
    Order.create(buyer:, recipient:, line_items:)
    ManagePayment.new(buyer, recipient, line_items, promotions).manage_payment
    HandleShipping.new(recipient, line_items).handle_shipping
  end
end
