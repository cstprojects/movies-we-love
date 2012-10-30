function lookup(inputString) {
    if(inputString.length == 0) {
        $('#suggestions').fadeOut(); // Hide the suggestions box
    } else {
        $.get("http://127.0.0.1:8080/movies-we-love/public_html/movies/search/" + inputString, function(data) { // Do an AJAX call
            $('#suggestions').fadeIn(); // Show the suggestions box
            $('#suggestions').html(data); // Fill the suggestions box
        });
    }
}