class BatchCheckout
  extend T::Sig

  attr_accessor :filename

  sig { params(filename: String).void }
  def initialize(filename)
    @filename = filename
  end

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

  sig { params(order_data: T::Hash[String, String]).returns(Person) }
  def buyer(order_data)
    Person.find(order_data["buyer_id"])
  end

  sig { params(order_data: T::Hash[String, String]).returns(String) }
  def recipient(order_data)
    order_data["recipient_id"]
  end

  sig { params(order_data: T::Hash[String, String]).returns(T::Array[LineItem]) }
  def line_items(order_data)
    order_data["line_items"].map do |line_item_data|
      LineItem.new(
        item: Item.find_by(name: line_item_data["item_name"]),
        quantity: Integer(line_item_data["quantity"])
      )
    end
  end
end
