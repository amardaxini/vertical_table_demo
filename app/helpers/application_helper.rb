# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def clearing_span
    content_tag(:span, '', :class => 'clear')
  end
   def active_css_class(class_name)
 
    classes = {
      'products'             => 'products'
          }
     if classes[controller.controller_name + '.' + controller.action_name] == class_name
      "active"
     elsif classes[controller.controller_name] == class_name
      "active"
     else
      ''
     end
#  if controller.controller_name + '.' + controller.action_name  == class_name
#    "active"
#  elsif controller.controller_name + '.' + controller.action_name == "articles.show"
#    "active"
#  end
 end
  
  def remove_child_link(name, f,dom_id)
    f.hidden_field(:_delete) + link_to_function(name, "remove_fields(this,'#{dom_id}')")
  end
  
  def add_child_link(name, f, method)
    fields = new_child_fields(f, method)
    link_to_function(name, h("insert_fields(this, \"#{method}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :form
    form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end
end
