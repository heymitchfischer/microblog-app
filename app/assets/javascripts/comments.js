$(document).ready(function() {
  var $newCommentButton = $("#new-comment-btn");
  var $commentsDiv = $("#comments-div");
  var $commentsForm = $("#comments-form");
  var $token = $('meta[name="csrf-token"]').prop("content");
  var $commentContent = $("#content");

  $newCommentButton.on("click", function() {
    event.preventDefault();

    $.ajax({
      url: $commentsForm.prop("action"),
      type: "post",
      dataType: "json",
      headers: {"X-CSRF-TOKEN": $token},
      data: {content: $commentContent.val()},
      success: function(response) {
        console.log(response);
        $commentContent.val("");
        var $newComment = $(`
          <div style="background-color: white; margin: 5px; padding: 5px;">
            <big>${response.user.first_name} ${response.user.last_name}</big>
            <small class="text-muted">${response.comment_formatted_time}</small>
            <p>${response.comment.content}</p>
            <a class="btn btn-danger" data-method="delete" href="/chirps/${response.comment.chirp_id}/comments/${response.comment.id}">Delete Comment</a>
          </div>`).hide();
        $commentsDiv.append($newComment.slideDown());
      },
      error: function(response) {
        console.log(response);
      }
    });

  });
});