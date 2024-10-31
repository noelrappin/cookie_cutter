class BatchCheckout
  attr_accessor :filename

  # @param filename [String]
  def initialize(filename)
    @filename = filename
  end

  # @return [void]
  def process
    data = JSON.load_file(filename)
    data.each do |order_data|
      CheckoutAction.new.checkout(
        buyer: buyer(order_data),
        recipient: recipient(order_data),
        line_items: line_items(order_data)
      )
    end
  end

  # @param order_data [Hash<String, Any>]
  # @return [Person]
  def buyer(order_data)
    Person.find(order_data["buyer_id"])
  end

  # @param order_data [Hash<String, Any>]
  # @return [String]
  def recipient(order_data)
    order_data["recipient_id"]
  end

  # @param order_data [Hash<String, Any>]
  # @return [Array<LineItem>]
  def line_items(order_data)
    order_data["line_items"].map do |line_item_data|
      LineItem.new(
        item: Item.find_by(name: line_item_data["item_name"]),
        quantity: Integer(line_item_data["quantity"])
      )
    end
  end
end
