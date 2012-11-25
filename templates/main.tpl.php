<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<?php print REL_PATH_TO_TEMPLATES; ?>/css/bootstrap.css">
    <link rel="stylesheet" href="<?php print REL_PATH_TO_TEMPLATES; ?>/css/style.css">
</head>
<body>

<div class="wrapp row">
    <div class="span8">
        <form class="form-search">
            <input type="text" placeholder="Search movies by typing title..." data-provide="typeahead"
                   class="input-xxlarge  typeahead" id="search">
        </form>
        <div id="suggestions"></div>
    </div>
</div>



<script>
    var path = "<?php print main_path; ?>";
</script>

<script src="<?php print REL_PATH_TO_TEMPLATES; ?>/js/jquery-1.8.2.min.js"></script>
<script src="<?php print REL_PATH_TO_TEMPLATES; ?>/js/bootstrap.js"></script>
<script src="<?php print REL_PATH_TO_TEMPLATES; ?>/js/lookup.js"></script>


</body>
</html>