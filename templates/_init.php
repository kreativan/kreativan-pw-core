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

include_once("./_lang.php");
include_once("./helpers/_func.php");
include_once("./helpers/_render.php");
include_once("./helpers/_menu.php");

$home           = $pages->get("/");
$site_settings  = $pages->get("template=system");

/**
 *  We are passing this as a parametar
 *  when using $files->include()
 *
 */
$global_vars = [
    "home" => $home,
    "site_settings" => $site_settings,
];

/**
 *  Global Settings
 *  using setting() functions API
 *  require processwire 3.0.119+
 *
 */
setting([
    "site_name" => $site_settings->site_info->site_name,
    "site_website" => $site_settings->site_info->website,
    "site_email" => $site_settings->site_info->email,
    "site_phone" => $site_settings->site_info->phone,
    "site_address" => $site_settings->site_info->address,
    "show_home" => ($modules->get("SiteMenu")->show_home == "1") ? true : false,
]);
