
<?php


if (array_key_exists('posters', $movie)) {
  $posters = $movie['posters'];
}


?>



<h3><?php print $movie['movie']['title'] ?></h3>
<p><?php print $movie['movie']['synopsis'] ?></p>
<img src="<?php print $posters['original']; ?>">
