# == Schema Information
#
# Table name: promotions
#
#  id         :integer          not null, primary key
#  code       :string
#  discount   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Promotion < ApplicationRecord
end
