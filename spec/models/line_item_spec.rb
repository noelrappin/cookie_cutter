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
require 'rails_helper'

RSpec.describe LineItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
