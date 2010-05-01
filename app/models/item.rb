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
class Item < ActiveRecord::Base
  attr_accessible :name, :is_active,:avatar
  belongs_to :product
  has_many :item_attributes,:dependent=>:destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
#                     :path => ":rails_root/:basename.:extension"
  #     validates_attachment_presence :avatar
  def create_update_item_attributes(item_attr)
    item_attr.each do |attributes|
      product_attribute = self.product.product_attributes.find(attributes[:product_attribute_id])
      if product_attribute.option_type == 'multi_select'
         multi_select_values = attributes.collect { |key,value| value if key =~ /value_/ }.uniq.compact
        attributes['value'] = multi_select_values
        unless multi_select_values.empty?
          # Delete the 'value_xx' attributes as they cannot be
          # stored in the database
          attributes.each do |key,value|
            attributes.delete(key) if key =~ /value_/
          end
       end
     end
     if attributes['id'].blank?
        self.item_attributes.create(attributes)
      else
        item_attribute= self.item_attributes.detect{|item_attr| item_attr.id == attributes['id'].to_i}
        item_attribute.value = attributes['value']
        item_attribute.save
      end
      
    end
  end 
end



