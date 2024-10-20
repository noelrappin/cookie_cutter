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
class Address < ApplicationRecord
end
