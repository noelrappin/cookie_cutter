class BatchCheckout
  attr_accessor :filename

  def initialize(filename)
    @filename = filename
  end

  def process
    data = JSON.load_file(filename)
    data.each do |order_data|
      CheckoutAction.new(
        buyer: buyer(order_data),
        recipient: recipient(order_data),
        line_items: line_items(order_data),
        promotions: []
      ).checkout
    end
  end

  def buyer(order_data)
    Person.find(order_data["buyer_id"])
  end

  def recipient(order_data)
    order_data["recipient_id"]
  end

  def line_items(order_data)
    order_data["line_items"].map do |line_item_data|
      LineItem.new(
        item: Item.find_by(name: line_item_data["item_name"]),
        quantity: Integer(line_item_data["quantity"])
      )
    end
  end
end
