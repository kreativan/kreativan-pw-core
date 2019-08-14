<?php namespace ProcessWire;
/**
 *  Module Admin UI
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *  @var Module $this_module
 *  @var string $page_name
 *  @var string $module_edit_URL
 *  @var Module $helper
 *
 *  Methods:
 *	$helper->pageEditLink($id)
 *	$helper->newPageLink($parent_id)
 *
*/

$adminURL 		= $this->config->urls->admin;
$moduleURL 		= $this_module->page->url;

$main_menu = $this->pages->get("/system/main-menu/");
$items = $main_menu->children("include=all, status!= trash");
$items_trash = $this->pages->find("template=menu-item, status=trash");

/* ===========================================================
    Create New
=========================================================== */

if($this->input->post->create_new) {

    $p = new Page();
    $p->template = "menu-item";
    $p->parent = $this->pages->get("/system/main-menu/");
    $p->title = $this->input->post->title;
    $p->save();

    $this->session->set("admin_status", "message");
    $this->session->set("admin_alert", $p->title . " has been created.");

    $redirectUrl = $page->url;
    $this->session->redirect($redirectUrl);


}

?>

<?php if($this->user->hasPermission('menu-manager')) :?>
    <?php
        include("./inc/tabs.php");

        if($page_name == "main") {
            include("./inc/table-sortable.php");
        } elseif($page_name == "trash") {
            include("./inc/table-trash.php");
        } elseif($page_name == "new") {
            include("./inc/new.php");
        }
    ?>
<?php else :?>
    <div class="uk-padding">
        <h3 class="uk-margin-remove">
            <?= __("You dont have permission to access this page.") ?>
        </h3>
    </div>
<?php endif;?>
