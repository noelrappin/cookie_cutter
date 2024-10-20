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
require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
