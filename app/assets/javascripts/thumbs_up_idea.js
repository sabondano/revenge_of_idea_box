$(document).on('ready page:load', function() {
  thumbsUpIdea()
});

function thumbsUpIdea() {
  $("#ideas").delegate(".glyphicon-thumbs-up", "click", function() {
    var $idea = $(this).closest(".idea");

    $.ajax({
      type: "PATCH",
      url: "api/v1/ideas/" + $idea.attr('data-idea-id') + "/thumbs-up",
      success: function(xhr) {
        changeQuality.call(this, xhr.quality); 
      }.bind(this),
      error: function() {

      }
    });
  });
}
