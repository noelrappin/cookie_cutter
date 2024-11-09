class CheckoutModel
  attr_reader :buyer, :recipient, :line_items, :promotions

  def initialize(buyer:, recipient:, line_items:, promotions: [])
    @buyer = buyer
    @recipient = recipient
    @line_items = line_items
    @promotions = promotions
  end

  def valid?
    buyer.valid? && recipient.valid?
  rescue
    false
  end

  def create_order
    Order.create(buyer:, recipient:, line_items:)
  end

  def subtotal
    line_items.sum { _1.cost_in_money }
  end
end
