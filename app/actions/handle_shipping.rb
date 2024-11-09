# frozen_string_literal: true

class HandleShipping < Literal::Object
  prop :recipient, Person, reader: :public
  prop :line_items, _Array(LineItem), reader: :public

  def handle_shipping
    Rails.logger.warn("I need to print a label for #{recipient.address}")
  end
end
