<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<?php print absolute_path_to_templates; ?>/css/bootstrap.css">
    <script src="<?php print absolute_path_to_templates; ?>/js/jquery-1.8.2.min.js"></script>
    <script src="<?php print absolute_path_to_templates; ?>/js/bootstrap.js"></script>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>

    <style>

            /* BASIC RESET */
        body, div, img, p { padding:0; margin:0; }
        a img { border:0 }

            /* HTML ELEMENTS */
        body { font-family:"Lucida Grande","Lucida Sans Unicode",Arial,Verdana,sans-serif; background-color:#efefef; background-image:url(../images/bg.jpg); }

            /* COMMON CLASSES */
        .break { clear:both; }

            /* SEARCH FORM */
        #searchform { margin:50px 200px; font-size:18px; }
        #searchform div { color:#eeeeee; }
        #searchform div input { font-size:18px; padding:5px; width:320px; }
        #suggestions{ position: relative; left:235px; width:320px; display:none; }

            /* SEARCHRESULTS */
        #searchresults { border-width:1px; border-color:#919191; border-style:solid; width:320px; background-color:#a0a0a0; font-size:10px; line-height:14px; }
        #searchresults a { display:block; background-color:#e4e4e4; clear:left; height:56px; text-decoration:none; }
        #searchresults a:hover { background-color:#b7b7b7; color:#ffffff; }
        #searchresults a img { float:left; padding:5px 10px; }
        #searchresults a span.searchheading { display:block; font-weight:bold; padding-top:5px; color:#191919; }
        #searchresults a:hover span.searchheading { color:#ffffff; }
        #searchresults a span { color:#555555; }
        #searchresults a:hover span { color:#f1f1f1; }
        #searchresults span.category { font-size:11px; margin:5px; display:block; color:#ffffff; }
        #searchresults span.seperator { float:right; padding-right:15px; margin-right:5px;
            background-image:url(../images/shortcuts_arrow.gif); background-repeat:no-repeat; background-position:right; }
        #searchresults span.seperator a { background-color:transparent; display:block; margin:5px; height:auto; color:#ffffff; }
    </style>
</head>
<body>


<script>
    google.setOnLoadCallback(function()
    {
        // Safely inject CSS3 and give the search results a shadow
        var cssObj = { 'box-shadow' : '#888 5px 10px 10px', // Added when CSS3 is standard
            '-webkit-box-shadow' : '#888 5px 10px 10px', // Safari
            '-moz-box-shadow' : '#888 5px 10px 10px'}; // Firefox 3.5+
        $("#suggestions").css(cssObj);

        // Fade out the suggestions box when not active
        $("input").blur(function(){
            $('#suggestions').fadeOut();
        });
    });

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