<?php

/**
 * ProcessHello.info.php
 *
 * Return information about this module.
 *
 * If preferred, you can use a getModuleInfo() method in your module file,
 * or you can use a ModuleName.info.json file (if you prefer JSON definition).
 *
 */

$info = array(

	// Your module's title
	'title' => 'Site Settings',

	// A 1 sentence description of what your module does
	'summary' => 'Core module for global site settings',

	// Module version number: use 1 for 0.0.1 or 100 for 1.0.0, and so on
	'version' => 1,

	// Name of person who created this module (change to your name)
	'author' => 'Ivan Milincic',

	// Icon to accompany this module (optional), uses font-awesome icon names, minus the "fa-" part
	'icon' => 'cog',

	// URL to more info: change to your full modules.processwire.com URL (if available), or something else if you prefer
	'href' => 'http://modules.processwire.com/',

	// name of permission required of users to execute this Process (optional)
	'permission' => 'site-settings',

	// permissions that you want automatically installed/uninstalled with this module (name => description)
	'permissions' => array(
		'site-settings' => 'Manage Site Settings'
	),

	// page that you want created to execute this module
	'page' => array(
		'name' => 'site-settings',
		'parent' => 'setup',
        'title' => 'Site Settings',
        'sort' => 1,
	),

	// optional extra navigation that appears in admin
    // if you change this, you'll need to a Modules > Refresh to see changes

    /*
	'nav' => array(
		array(
			'url' => '',
			'label' => 'Kreativan UI',
			'icon' => 'smile-o',
		),
		array(
			'url' => 'subpage/',
			'label' => 'Subpage',
			'icon' => 'beer',
		),
    ),
    */


	// for more options that you may specify here, see the file: /wire/core/Process.php
    // and the file: /wire/core/Module.php

    'singular' => true,
    'autoload' => false,

);
