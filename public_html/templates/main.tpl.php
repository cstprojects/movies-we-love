<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<?php print absolute_path_to_templates; ?>/css/bootstrap.css">
    <link rel="stylesheet" href="<?php print absolute_path_to_templates; ?>/css/style.css">
    <script src="<?php print absolute_path_to_templates; ?>/js/jquery-1.8.2.min.js"></script>
    <script src="<?php print absolute_path_to_templates; ?>/js/bootstrap.js"></script>

</head>
<body>


<script>
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

</script>

<form class="form-search">
    <input type="text" data-provide="typeahead" class="input-xxlarge  typeahead" onkeyup="lookup(this.value);">
    <button type="submit" class="btn">Search</button>
</form>
<div id="suggestions"></div>



</body>
</html>