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

  def self.role_person(person_or_nil, role)
    case
    when role == "buyer" && person_or_nil.nil?
      NullBuyer.new
    when role == "buyer" && !person_or_nil.nil?
      BuyerPerson.new(person_or_nil)
    when role == "recipient" && person_or_nil.nil?
      NullRecipient.new
    when role == "recipient" && !person_or_nil.nil?
      RecipientPerson.new(person_or_nil)
    end
  end

  def self.sorted = all.sort_by { _1.name }

  def tax_status
    "something"
  end

  class NullBuyer
    def nillish? = true

    def log_identity
      Rails.logger.warn("There is no buyer")
    end
  end

  class NullRecipient
    def nillish? = true

    def log_identity
      Rails.logger.warn("There is no recipient")
    end
  end

  class RolePerson < SimpleDelegator
    def nillish? = false

    def person = __getobj__
  end

  class BuyerPerson < RolePerson
    def log_identity
      Rails.logger.debug("Person #{name} is a buyer")
    end
  end

  class RecipientPerson < RolePerson
    def log_identity
      Rails.logger.debug("Person #{name} is a recipient")
    end
  end
end
