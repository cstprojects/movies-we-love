<?php
/*
  * Implements Template for single movie page
  * expected object is $movie
  */
?>
<?php


if(array_key_exists('posters', $movie)){
  $posters = $movie['posters'];
}
?>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<?php print main_path . path_to_templates; ?>/css/style.css">
</head>
<body>

<h3><?php print $movie['movie']['title'] ?></h3>
<p><?php print $movie['movie']['synopsis'] ?></p>
<img src="<?php print $posters['original']; ?>">

</body>
</html>