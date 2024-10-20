# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  city        :string
#  country     :string
#  number      :string
#  postal_code :string
#  state       :string
#  street      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
