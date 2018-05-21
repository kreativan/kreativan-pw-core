<?php

/**
 * Initialization file for template files
 *
 * This file is automatically included as a result of $config->prependTemplateFile
 * option specified in your /site/config.php.
 *
 * You can initialize anything you want to here. In the case of this beginner profile,
 * we are using it just to include another file with shared functions.
 *
 */

include_once("./_func.php"); // include our shared functions

$home           = $pages->get("/");
$system         = $pages->get("template=system");

/**
 *  Pass global vars when using
 *  @example $files->indlude("my_file.php", $global_vars);
 *
 */
$global_vars = [
    "home" => $home,
    "system" => $system,
];
