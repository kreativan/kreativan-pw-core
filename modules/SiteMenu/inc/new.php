<?php
/**
 *  new.php
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *
*/

// Build form
$form = $this->modules->get("InputfieldForm");
$form->action = $page->url;
$form->method = "post";
$form->attr("id+name","create_new");

// Title
$f = $this->modules->get("InputfieldText");
$f->attr('name', 'title');
$f->attr('required', '');
$f->label = 'Menu Item Title';
$f->required = true;
$form->append($f);

// Submit
$submit = $this->modules->get("InputfieldSubmit");
$submit->attr("value","Save");
$submit->attr("id+name","create_new");
$submit->attr("class","ui-button");
$form->append($submit);

echo $form->render();