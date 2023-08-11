(function() {
  $(document).on("turbolinks:load", function() {
    return $("#new_message").on("keypress", function(e) {
      if (e && e.keyCode === 13) {
        return $(this).submit;
      }
    });
  });

}).call(this);
