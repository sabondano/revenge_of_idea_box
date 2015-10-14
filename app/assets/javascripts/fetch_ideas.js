$(document).on('ready page:load', function() {
  $.get( "api/v1/ideas", function( data ) {
    $( "#ideas" ).append(createIdeas(data));
  });  
});

function createIdeas(data) {
  return data.map(createDivElementFromIdea);
}
