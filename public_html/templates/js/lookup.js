jQuery(document).ready(function(){

    $('#search').bind('keydown',function(){
        lookup(this.value);
    });
});


function lookup(inputString) {
    if(inputString.length == 0) {
        $('#suggestions').fadeOut(); // Hide the suggestions box
    } else {
        $.get("movies/search/" + inputString, function(data) { // Do an AJAX call
            $('#suggestions').fadeIn(); // Show the suggestions box
            $('#suggestions').html(data); // Fill the suggestions box
        });
    }
}