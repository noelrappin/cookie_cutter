class CheckoutAction

  # @param buyer [Person]
  # @param recipient [Person]
  # @param line_items [Array<LineItem>]
  # @param promotions [Array<String>]
  # @return [void]
  def checkout(buyer:, recipient:, line_items:, promotions: [])
    ManagePayment.new.manage_payment(buyer, recipient, line_items, promotions)
    Order.create(buyer:, recipient:, line_items:)
  end
end
