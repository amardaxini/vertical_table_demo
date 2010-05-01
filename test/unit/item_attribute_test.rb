# == Schema Information
#
# Table name: item_attributes
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  value                :text
#  item_id              :integer(4)
#  product_attribute_id :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

require 'test_helper'

class ItemAttributeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ItemAttribute.new.valid?
  end
end
