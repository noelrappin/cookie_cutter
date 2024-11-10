# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer          not null
#  order_id   :integer          not null
#
# Indexes
#
#  index_line_items_on_item_id   (item_id)
#  index_line_items_on_order_id  (order_id)
#
# Foreign Keys
#
#  item_id   (item_id => items.id)
#  order_id  (order_id => orders.id)
#
class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :order, optional: true

  def cost_in_cents = item.price_in_cents * quantity

  def cost_in_money = Money.from_cents(cost_in_cents, "USD")

  def tax_rate_object(buyer)
    if buyer.tax_exempt?
      UnTaxed.new(line_item: self, buyer:)
    elsif buyer.us_based?
      UsTaxRate.new(line_item: self, buyer:)
    elsif buyer.canada_based?
      CaTaxRate.new(line_item: self, buyer:)
    end
  end

  UsTaxRate = Data.define(:buyer, :line_item) do
    def tax = line_item.cost_in_cents * 0.08
  end

  CaTaxRate = Data.define(:buyer, :line_item) do
    def tax = line_item.cost_in_cents * 0.10
  end

  UnTaxed = Data.define(:buyer, :line_item) do
    def tax = 0
  end
end
