$(document).on('ready page:load', function() {
  deleteIdea()
});

function deleteIdea() {
  $("#ideas").delegate(".btn-delete", 'click', function() {
    var $idea = $(this).closest(".idea")    

    $.ajax({
      type: "DELETE",
      url: "/api/v1/ideas/" + $idea.attr('data-idea-id'),
      success: function() {
        $idea.remove()
      },
      error: function() {
        $idea.remove()
      }
    })
  })  
}
