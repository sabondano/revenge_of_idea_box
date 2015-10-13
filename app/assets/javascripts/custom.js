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
  var body     = $("<p>",  { text: idea.body });
  var quality  = $("<p>",  { text: idea.quality  });
  var ideaDiv = $("<div>", { "data-idea-id": idea.id })
    .append(title)
    .append(body)
    .append(quality);

  return ideaDiv;
}
