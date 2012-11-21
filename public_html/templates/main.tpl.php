<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<?php print absolute_path_to_templates; ?>/css/bootstrap.css">
    <link rel="stylesheet" href="<?php print absolute_path_to_templates; ?>/css/style.css">
</head>
<body>

<div class="wrapp row">
    <div class="span8">
        <form class="form-search">
            <input type="text" placeholder="Search movies by typing title..." data-provide="typeahead" class="input-xxlarge  typeahead" onkeyup="lookup(this.value);">
        </form>
        <div id="suggestions"></div>
    </div>
</div>


<script>
    var path = "<?php print main_path; ?>" ;
</script>

<script src="<?php print absolute_path_to_templates; ?>/js/jquery-1.8.2.min.js"></script>
<script src="<?php print absolute_path_to_templates; ?>/js/bootstrap.js"></script>
<script src="<?php print absolute_path_to_templates; ?>/js/lookup.js"></script>



</body>
</html>