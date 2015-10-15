$(document).on('ready page:load', function() {
  searchIdeas()
});

function searchIdeas() {
  $("#q").on('keyup', function() {
    $( ".idea" ).children(".title").each( function( index, element ){
      if ( ($(this).text().toLowerCase().indexOf($("#q").val().toLowerCase()) >= 0) || ( $(this).siblings(".body").text().toLowerCase().indexOf($("#q").val().toLowerCase()) >= 0 ) ) {
        $(this).closest(".idea").show();
      } else if ( ($(this).text().toLowerCase().indexOf($("#q").val().toLowerCase()) == -1) || ($(this).siblings(".body").text().toLowerCase().indexOf($("#q").val().toLowerCase()) == -1) ) {
        $(this).closest(".idea").hide();
      }
    });
  });
}
