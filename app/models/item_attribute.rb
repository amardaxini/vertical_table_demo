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

class ItemAttribute < ActiveRecord::Base
  attr_accessible :name, :value, :item_id, :product_attribute_id
  belongs_to :item
  belongs_to :product_attribute
  serialize :value
end
