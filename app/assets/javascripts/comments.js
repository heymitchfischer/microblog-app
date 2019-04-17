$(document).ready(function() {
  var $newCommentButton = $("#new-comment-btn");
  var $commentsDiv = $("#comments-div");

  $newCommentButton.on("click", function() {
    event.preventDefault();
    var $newComment = $(`
      <div style="background-color: white; margin: 5px; padding: 5px;">
        <big>Mitch Fischer</big>
        <small class="text-muted">Some Time</small>
        <p>New Comment!</p>
      </div>`).hide();
    $commentsDiv.append($newComment.slideDown());
  });
});