$( document ).ready(function() {
  $('#signup-modal').on('show.bs.modal', function () {
    $.get("/users/new").done(function (data) {
      $("#signup-modal .modal-body").html(data);
      $('#signup-modal form').on('ajax:success', function(e, xhr) {
        window.location = "/?fromsignup=true"

      });
      $('#signup-modal form').on('ajax:error', function(e, xhr) {
        $("#signup-modal .modal-body").html(xhr.responseText);
      });
    });
  });
});
