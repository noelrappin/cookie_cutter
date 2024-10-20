# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  buyer_id     :integer          not null
#  recipient_id :integer          not null
#
# Indexes
#
#  index_orders_on_buyer_id      (buyer_id)
#  index_orders_on_recipient_id  (recipient_id)
#
class Order < ApplicationRecord
  belongs_to :buyer, class_name: "Person"
  belongs_to :recipient, class_name: "Person"
  has_many :line_items

  def cost_in_cents = line_items.map { _1.cost_in_cents }.sum

  def cost_in_money = Money.from_cents(cost_in_cents, "USD")
end
