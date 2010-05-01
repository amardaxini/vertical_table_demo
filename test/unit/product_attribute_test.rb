require 'test_helper'

class ProductAttributeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProductAttribute.new.valid?
  end
end

# == Schema Information
#
# Table name: product_attributes
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  option_type   :string(255)
#  option        :string(255)
#  product_id    :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#  is_searchable :boolean(1)
#

