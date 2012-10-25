<?php
/*
 * embed() implements function for templating
 */
function embed($file, $vars) {
  ob_start();
  extract($vars, EXTR_SKIP);
  include($file);
  $content = ob_get_contents();
  ob_end_clean();
  return $content;
}

function escapeMssql($string) {
  return str_replace("'", "''", $string);
}