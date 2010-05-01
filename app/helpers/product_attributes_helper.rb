module ProductAttributesHelper
 def attribute_options(product_attribute)
    if !product_attribute.option.blank?
      if product_attribute.option.is_a?(Array)
        product_attribute.option.join(', ') 
      else
        product_attribute.option
      end
    else
      "No options"
    end
  end
end
