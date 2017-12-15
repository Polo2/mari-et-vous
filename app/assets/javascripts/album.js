$(document).ready(function() {

    $.attachinary.config.template = '\
      <div>\
          <% for(var i=0; i<files.length; i++){ %>\
            <div class="flex_block col-xs-12 col-sm-2">\
              <img\
                src="<%= $.cloudinary.url(files[i].public_id, { "version": files[i].version, "format": "jpg", "crop": "fill", "width": 150, "height": 200 }) %>"\
                alt="" width="150" height="200" />\
              <a href="#" class="remove-photo fa fa-minus-circle" data-remove="<%= files[i].public_id %>"></a>\
            </div>\
          <% } %>\
        </div>\
    ';

  // $(document)
  //  .on('drop dragover', function (e) {
  //     e.preventDefault();
  //   })
  //   .on('cocoon:after-insert', function() {
  //     $('.attachinary-input').attachinary();
  //   })
  //   .on('fileuploadstart', function(e) {
  //     $(".add_fields").click();
  //     $(e.target).parents('.nested-fields').find('.remove_fields').show();
  //     $(e.target).parents('.nested-fields').find('.add_plus').hide();
  //   });

  // $(".add_fields").click();
} );

