<?php namespace ProcessWire;
/**
 *  Tabs Admin UI
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *  @var string $page_name
 *
*/

// New
$new_item_link = "{$page->url}new";

?>


<ul class="uk-tab uk-position-relative">

    <li class="<?= ($page_name == "main") ? "uk-active" : ""; ?>">
        <a href="<?= $page->url ?>">
            <?= $main_menu->title ?>
        </a>
    </li>

    <?php if($page_name != "trash") :?>
        <li class="<?= ($page_name == "new") ? "uk-active" : ""; ?>">
            <?php if($page_name == "new") :?>
                <a href="<?= $page->url ?>">
                    <i class="fa fa-arrow-left"></i> <?= __("Back"); ?> 
                </a>
            <?php else :?>
                <a href="<?= $page->url ?>new">
                    <i class="fa fa-plus-circle"></i> <?= __("Add New"); ?> 
                </a>
            <?php endif;?>
        </li>
    <?php endif;?>

    <?php if($items_trash->count > 0) :?>
        <li>
            <a href="./trash/">
                <i class="fa fa-trash"></i>
                <?= __("Trash"); ?> 
                <span>(<?= $items_trash->count ?>)</span>
            </a>
        </li>
    <?php endif;?>

</ul>
