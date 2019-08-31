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

include("./inc/tabs.php");

if($page_name == "main") {
    include("./inc/pw-table.php");
}
?>
