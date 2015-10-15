$(document).on('ready page:load', function() {
  searchIdeas()
});

function searchIdeas() {
  $("#q").on('keyup', function() {
    $( ".idea" ).children(".title").each( function( index, element ){
      var findMatchForTitle = $(this).text().toLowerCase().indexOf($("#q").val().toLowerCase());
      var findMatchForBody = $(this).siblings(".body").text().toLowerCase().indexOf($("#q").val().toLowerCase());

      if ( ( findMatchForTitle >= 0 ) || ( findMatchForBody >= 0 ) ) {
        $(this).closest(".idea").show();
      } else if ( (findMatchForTitle == -1) || ( findMatchForBody == -1) ) {
        $(this).closest(".idea").hide();
      }
    });
  });
}
