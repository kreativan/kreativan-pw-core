<?php
/**
 * Shared functions used by the beginner profile
 *
 * This file is included by the _init.php file, and is here just as an example.
 * You could place these functions in the _init.php file if you prefer, but keeping
 * them in this separate file is a better practice.
 *
 *	loadJS($js)
 *  loadCSS($js)
 *
 *  evenOdd($i++)
 *  timeAgo(@time_stamp)
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


/**
 *  Even/Odd
 *
 */
function evenOdd($number) {
    if ($number % 2 == 0) {
        return "even";
    } else {
        return "odd";
    }
}


/**
 *  Time Ago
 *  @param time_stamp|date $datetime
 *  @example timeAgo(@time_stamp);
 *  @example timeAgo(2019-05-01 00:22:35);
 *  @example timeAgo('2019-05-01 00:22:35', true);
 *
 */
function timeAgo($datetime, $full = false) {

    $now = new \DateTime;
    $ago = new \DateTime($datetime);
    $diff = $now->diff($ago);
    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;
    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }
    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';

}
