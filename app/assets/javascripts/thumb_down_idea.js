$(document).on('ready page:load', function() {
  thumbsDownIdea()
});

function thumbsDownIdea() {
  $("#ideas").delegate(".glyphicon-thumbs-down", "click", function() {
    var $idea = $(this).closest(".idea");

    $.ajax({
      type: "PATCH",
      url: "api/v1/ideas/" + $idea.attr('data-idea-id') + "/thumbs-down",
      success: function(xhr) {
        changeQuality.call(this, xhr.quality); 
      }.bind(this),
      error: function() {

      }
    });
  });
}
