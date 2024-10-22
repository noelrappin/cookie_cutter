class BatchCheckout
  attr_accessor :filename

  def initialize(filename)
    @filename = filename
  end

  def process
    data = JSON.load_file(filename)
    data.each do |order_data|
      line_items = order_data["line_items"].map do |line_item_data|
        LineItem.new(
          item: Item.find_by(name: line_item_data["item_name"]),
          quantity: Integer(line_item_data["quantity"])
        )
      end
      CheckoutAction.new.checkout(
        buyer: Person.find(order_data["buyer_id"]),
        recipient: order_data["recipient_id"],
        line_items: line_items
      )
    end
  end
end
