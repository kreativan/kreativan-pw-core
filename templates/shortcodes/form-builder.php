<?php
/**
 *  Form Builder Shortcode
 * 
 */

if(strpos($_SERVER['REQUEST_URI'], $this->wire('config')->urls->admin) !== 0) {

    echo "<div class='$class'>";
    $form = $forms->render("$form_name");
    echo $form->styles;
    echo $form->scripts;
    echo $form;
    echo "</div>";

}