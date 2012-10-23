<?php
/*
  * Implements Template for single movie page
  * expected object is $movie
  */
?>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<?php print main_path . path_to_templates; ?>css/style.css">
</head>
<body>

<h3><?php print $movie->title; ?></h3>

</body>
</html>