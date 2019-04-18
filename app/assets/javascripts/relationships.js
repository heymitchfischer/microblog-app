$(document).ready(function() {
  var $followLinks = $(".follow-link");
  var $token = $('meta[name="csrf-token"]').prop("content");

  $followLinks.on("click", function() {
    event.preventDefault();
    event.stopPropagation();

    console.log(event.target.href);
    var $clickedLink = $(event.target);

    $.ajax({
      url: event.target.href,
      type: "post",
      dataType: "json",
      headers: {"X-CSRF-TOKEN": $token},
      success: function(response) {
        $clickedLink.fadeOut();
      },
      error: function(response) {
        console.log(response);
      }
    })
  });
})