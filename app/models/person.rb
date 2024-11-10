# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :integer          not null
#
# Indexes
#
#  index_people_on_address_id  (address_id)
#
# Foreign Keys
#
#  address_id  (address_id => addresses.id)
#
class Person < ApplicationRecord
  belongs_to :address

  def self.sorted = all.sort_by { _1.name }

  def tax_status
    "something"
  end
end
