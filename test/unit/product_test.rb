# == Schema Information
#
# Table name: products
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Product.new.valid?
  end
end
