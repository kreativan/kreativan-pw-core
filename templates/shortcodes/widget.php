<?php
/**
 *  Widget shortcode
 *
 *
*/

// if its not admin pages
if(strpos($_SERVER['REQUEST_URI'], $this->wire('config')->urls->admin) !== 0) {

    $widget =  wire("pages")->get("id=$id");

    echo "<div class='tm-widget-shortcode'>";

    $files->include(setting("widgetsPATH")."$widget->template.php",[
        "widget" => $widget
    ]);
    
    echo "</div>";

}
