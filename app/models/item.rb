# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  name           :string
#  price_in_cents :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Item < ApplicationRecord
end
