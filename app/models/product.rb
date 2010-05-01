# == Schema Information
#
# Table name: products
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Product < ActiveRecord::Base
  attr_accessible :name
  has_many :items,:dependent=>:destroy
  has_many :product_attributes,:dependent=>:destroy
end
