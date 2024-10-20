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
require 'rails_helper'

RSpec.describe Person, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
