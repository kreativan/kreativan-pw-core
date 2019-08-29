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

// lng
function lng($string) {
    include(wire('config')->paths->templates . "_lang.php");
    return $lng["$string"];
}

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
 *  Calculate difference between two dates
 *  and get the results in specified format
 *  @param integer $date1 - timestamp
 *  @param integer $date2 - timestamp
 *  @param string $format - days|years|months|hours|minutes
 *  @return integer
 */
function dateTimeDiff($date1, $date2, $format = "days") {

    $date1 = date("Y-m-d H:i:s", (int)$date1);
    $date2 = date("Y-m-d H:i:s", (int)$date2);

    $start_date = new \DateTime($date1);
    $end_date   = new \DateTime($date2);
    $diff = $start_date->diff($end_date);

    switch ($format) {
        case 'days':
            $result = $diff->days;
            break;
        case 'years':
            $result = $diff->y;
            break;
        case 'months':
            $result = $diff->m;
            break;
        case 'hours':
            $result = $diff->days * 24;
            break;
        case 'minutes':
            $result = $diff->days * 24 * 60;
            $result += $diff->h * 60;
            $result += $diff->i;
            break;
        default:
            $result = $diff->d;
            break;
    }

    return (int)$result;

}
