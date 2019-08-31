<?php
/**
 *  Form Builder Shortcode
 *
 */

if(strpos($_SERVER['REQUEST_URI'], $this->wire('config')->urls->admin) !== 0) {

    echo "<div class='$class'>";
    echo !empty($headline) ? "<h3>$headline</h3>" : "";
    $form = $forms->render("$form_name");
    echo $form->styles;
    echo $form->scripts;
    echo $form;
    echo "</div>";

}
