task process: :environment do
  CheckoutAction.new.checkout(
    buyer: Person.find("1"),
    recipient: "2",
    line_items: [
      LineItem.new(
        item: Item.find_by(name: "Chocolate Chip"),
        quantity: Integer("1")
      )
    ]
  )
end
