<?php namespace ProcessWire;

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

include_once("./helpers/_func.php"); // include our shared functions
include_once("./helpers/_lang.php");

/**
 *  Global Settings
 *  using setting() functions API
 *  require processwire 3.0.119+ 
 * 
 */
setting([
    "home" => $pages->get("/"),
    "system" => $pages->get("template=system"),
]);
