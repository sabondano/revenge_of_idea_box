$(document).on('ready page:load', function() {
  if (window.location.pathname === "/") {
    $.get( "api/v1/ideas", function( data ) {
      $( "#ideas" ).append(createIdeas(data));
    });  
  }
});

function createIdeas(data) {
  return data.map(createDivElementFromIdea);
}
