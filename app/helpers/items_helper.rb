module ItemsHelper
 def display_answer_field(item_attribute,attr_form)
    output = ""
    output << attr_form.hidden_field(:product_attribute_id, :index => nil)  
    output << attr_form.hidden_field(:name, :index => nil)  
    output << attr_form.hidden_field(:id, :index => nil) unless item_attribute.new_record?
    case item_attribute.product_attribute.option_type
    when "checkbox" 
      output << hidden_field_tag('item[item_attributes][][value]',false)
      output << check_box_tag('item[item_attributes][][value]', true,!item_attribute.value.blank?)
      
    when "multi_select"
      item_attribute.product_attribute.option.each_with_index do |q, index|
        output << check_box_tag("item[item_attributes][][value_#{index+1}]", q, !item_attribute.value.blank? && item_attribute.value.include?(q)) + q + "<br/>\n" 
      end
       
    when "drop_down"
      question_data = [''] #+ ra_answer.ra_question.question_data
      output << select_tag('item[item_attributes][][value]',                                                                                           options_for_select(item_attribute.product_attribute.option,item_attribute.value),  :index => nil)
      
    else
      output << attr_form.text_area(:value, :rows => 5, :index => nil)
    end
 
    output
  end
end
