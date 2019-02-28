<?php
/**
 * Shared functions used by the beginner profile
 *
 * This file is included by the _init.php file, and is here just as an example.
 * You could place these functions in the _init.php file if you prefer, but keeping
 * them in this separate file is a better practice.
 *
 *	@method loadJS($js)
 *  @method loadCSS($js)
 *
*/

// load js
function loadJS($js) {
    wire('config')->scripts->add($js);
}
// load css
function loadCSS($css) {
    wire('config')->styles->add($css);
}