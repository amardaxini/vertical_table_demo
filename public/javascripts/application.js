function insert_fields(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g")
  $(link).before(content.replace(regexp, new_id));
}

function remove_fields(link,address) {

  var hidden_field = $(link).prev("input[type=hidden]");
  if (hidden_field) {
     hidden_field.val('1');
    
  }
  $(link).closest("."+address).hide();
   // $(link).parent('.task').hide();
}
