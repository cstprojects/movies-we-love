<?php
/*
  * Implements Template for single movie page
  * expected object is $movie
  */



/*
print_r($movie);
exit();*/
?>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<?php print REL_PATH_TO_TEMPLATES; ?>/css/bootstrap.css">
    <link rel="stylesheet" href="<?php print REL_PATH_TO_TEMPLATES; ?>/css/style.css">
</head>
<body>
<?php

if (array_key_exists('posters', $movie)) {
  $posters = $movie['posters'];
}


?>



<h3><?php print $movie['movie']['title'] ?></h3>
<p><?php print $movie['movie']['synopsis'] ?></p>
<img src="<?php print $posters['original']; ?>">

</body>
</html>