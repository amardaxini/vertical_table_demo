
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
class ProductAttribute < ActiveRecord::Base
  attr_accessible :name, :option_type, :option,:is_searchable
  belongs_to :product
  has_many :item_attributes
  OPTION_TYPES = ["text", "checkbox", "drop_down", "multi_select"]
  DISPLAY_TYPES = [ ["Text", "text"], 
                    ["Checkbox", "checkbox"], 
                    ["Drop down menu", "drop_down"], 
                    ["Multiple choice list", "multi_select"] ]
  serialize :option
  before_save :remove_options_for_text_check_box
  def remove_options_for_text_check_box
 
    if ['text', 'checkbox'].include?(self.option_type)
      self.option = ""
    end
  end
end


