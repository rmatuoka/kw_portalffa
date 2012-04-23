// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
changeSelects = function (id1, id2, template) { 
   jQuery('#' + id1).live('change', function() { 
	//alert(jQuery('#' + id1 + ' :selected').val());
     var webpart = jQuery('#' + id1 + ' :selected').val(); 
     if(webpart == "") webpart="0"; 
     jQuery.get('/admin/templates/'+ template +'/webmodules/popula_ids?webpart=' + webpart, function(data){ 
         jQuery("#" + id2).html(data); 
     }) 
     return false;
   }); 
 }