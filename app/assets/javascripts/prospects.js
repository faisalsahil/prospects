(function($){
    if ($(".prospects.show").length){
      var Modal = { state: 'inactive' },
          RestInPlace  = { state: 'inactive' },
          Keyshortcuts = { active: function(){
              return Modal.state === 'inactive' && RestInPlace.state === 'inactive';
          }
      };

      $("body.prospects.show").keypress(function(e) {
          if (Keyshortcuts.active()){
              e.preventDefault();
              if (e.charCode === 99){
                  $("#call-modal").modal('show');
              }
              if (e.charCode === 101){
                  $("#email-modal").modal('show');
              }
              if (e.charCode === 116){
                  $("#tag-modal").modal('show');
              }
          }
      });

      // Bind to modal show
      $("body.prospects.show #call-modal").on('shown', function() {
          Modal.state = 'active';
          $("#call-modal #event_type").focus();
      });

      $("body.prospects.show #email-modal").on('shown', function() {
          Modal.state = 'active';
          $("#email-modal #email_to").focus();
          $("#email-modal #email_to").val($("#email-modal #email_to").val());  // hax to make it unselect value
      });

      $("body.prospects.show #tag-modal").on('shown', function() {
          Modal.state = 'active';
          $("#tag-modal #prospect_tag_list").focus();
          $("#tag-modal #prospect_tag_list").val($("#tag-modal #prospect_tag_list").val()); // hax to make it unselect value
      });

      // Bind to modal hide
      $("body.prospects.show #call-modal").on('hide', function() {
          Modal.state = 'inactive';
      });

      $("body.prospects.show #email-modal").on('hide', function() {
          Modal.state = 'inactive';
      });

      $("body.prospects.show #tag-modal").on('hide', function() {
          Modal.state = 'inactive';
      });

      $("body.prospects.show #email-modal form").bind("ajax:success", function(){
          $("#email-modal").modal('hide');
          location.reload();
      }).bind("ajax:failure", function(){
          alert("unable to create event");
      });

      $("body.prospects.show #tag-modal form").bind("ajax:success", function(){
          $("#tag-modal").modal('hide');
          location.reload();
      }).bind("ajax:failure", function(){
          alert("unable to create tag");
      });

      // Rest in place must modify state when active/inactive
      $(document).on('activate.rest-in-place', ".rest-in-place", function(event, data){
          RestInPlace.state = 'active';
      });
      $(document).on('success.rest-in-place', ".rest-in-place", function(event, data){
          RestInPlace.state = 'inactive';
      });
      $(document).on('failure.rest-in-place', ".rest-in-place", function(event, data){
          RestInPlace.state = 'inactive';
      });
      $(document).on('abort.rest-in-place', ".rest-in-place", function(event, data){
          RestInPlace.state = 'inactive';
      });

      // setup datetime picker
      $('.datepicker').datetimepicker({
          timezoneText: "Zone",
          showButtonPanel: false,
          dateFormat: "yy/mm/dd",
          timeFormat: "hh:mm tt z",
          showTime: false,
          numberOfMonths: 1,
          showOtherMonths: true,
          selectOtherMonths: true,
          hourMin: 6,
          hourMax: 21,
          minDate: -1,
          controlType: 'select',
          showTimezone: true,
          stepMinute: 15,
          timezoneList: [
              { value: '-0500', label: 'Eastern (-5)'},
              { value: '-0600', label: 'Central (-6)' },
              { value: '-0700', label: 'Mountain (-7)' },
              { value: '-0800', label: 'Pacific (-8)' }
          ]
      });

      // make tags clickable.  they add the tag to the list.
      $(".tags").on("click", "span", function(event){
          event.preventDefault();
          var tag = $(this).html();
          $("#prospect_tag_list").val(function(i, val){
              if (val === ''){
                  return tag;
              }
              else {
                  return val + ', ' + tag;
              }
          });
      });
    }
}(jQuery));
