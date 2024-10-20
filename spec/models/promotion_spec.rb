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
require 'rails_helper'

RSpec.describe Promotion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
