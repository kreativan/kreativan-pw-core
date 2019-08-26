<?php
/**
 *  Quote Shotrcode
 *
*/

if(strpos($_SERVER['REQUEST_URI'], $this->wire('config')->urls->admin) !== 0) {


    $files->include($config->paths->templates."markup/quote.php", [
        "text" => $text,
        "author" => $author
    ]);

}
