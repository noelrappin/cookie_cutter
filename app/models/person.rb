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

  def self.from(object)
    if object.is_a?(GlobalID)
      object = object.find
    end
    case object
    when Integer
      Person.find(object)
    when String
      Person.find_by(email: object)
    when Person
      object
    else
      raise "#{object} isn't a user"
    end
  end

  def self.sorted = all.sort_by { _1.name }
end
