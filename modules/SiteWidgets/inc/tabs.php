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

$widgets = $this->pages->get("template=widgets");

?>


<ul class="uk-tab uk-position-relative">

    <li class="<?= ($page_name == "main") ? "uk-active" : ""; ?>">
        <a href="<?= $page->url ?>">
            <?= $page->title ?>
        </a>
    </li>

    <?php if($this->user->isSuperuser()):?>
        <li>
            <a href="<?= $this->config->urls->admin ?>page/add/?parent_id=<?= $widgets->id ?>" title="Create new">
                <i class="fa fa-plus"></i>
            </a>
        </li>
    <?php endif;?>

</ul>
