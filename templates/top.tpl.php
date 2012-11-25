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
                   class="input-xxlarge  typeahead" onkeyup="lookup(this.value);">
        </form>
        <div id="suggestions"></div>
    </div>
</div>