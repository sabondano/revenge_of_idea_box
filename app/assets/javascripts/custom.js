$(document).on('ready page:load', function() {
  $.get( "api/v1/ideas", function( data ) {
    $( "#ideas" ).append(createIdeas(data));
  });  
});

function createIdeas(data) {
  return data.map(createDivElementFromIdea);
}

function createDivElementFromIdea(idea) {
  var title    = $("<h4>", { text: idea.title });
  var body     = $("<p>",  { text: _.trunc(idea.body,
        { "length": 100, "separator": " "}) });
  var quality  = $("<p>",  { text: "quality: " + idea.quality });
  var thumbsUp = $("<span>", { class: "glyphicon glyphicon-thumbs-up",
    "aria-hidden": "true" });                               
  var thumbsDown = $("<span>", { class: "glyphicon glyphicon-thumbs-down",
    "aria-hidden": "true" });                               
  var ideaDiv = $("<div>", { "data-idea-id": idea.id })
    .append(title)
    .append(body)
    .append(quality)
    .append(thumbsUp)
    .append(thumbsDown);

  return ideaDiv;
}
