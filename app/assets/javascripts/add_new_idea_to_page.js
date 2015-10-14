$(document).on('ready page:load', function() {
  $("#new-idea-form").on("ajax:success", function(event, data, status, xhr) {
    $("#ideas").append(createDivElementFromIdea(data));
    $("#idea_title").val("");
    $("#idea_body").val("");
    ideaCreatedNotice.call(this);
    setTimeout('$(".alert").fadeOut("slow")', 5000);
  }); 
});

function ideaCreatedNotice() {
  var flashNotice = $("<div>");
  flashNotice.text("New idea created!");
  flashNotice.attr("class", "alert alert-success");
  flashNotice.attr("role", "alert");
  $(this).prepend(flashNotice);
}
