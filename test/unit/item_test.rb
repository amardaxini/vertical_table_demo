require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Item.new.valid?
  end
end

# == Schema Information
#
# Table name: items
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  is_active           :boolean(1)
#  product_id          :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_size :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#

