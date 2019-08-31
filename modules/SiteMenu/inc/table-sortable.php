<?php namespace ProcessWire;
/**
 *  Table Admin UI
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *
*/

?>

<table class="ivm-table uk-table uk-table-striped uk-table-middle uk-table-small uk-margin-remove">

    <thead>
        <tr>
            <th></th>
            <th>Title</th>
            <th class="uk-visible@m">Link Type</th>
            <th>Link</th>
            <th class="uk-text-center uk-visible@m">
                <?= ($this->input->get->menu) ? "Submenu" : "Dropdown" ?>
            </th>
            <th></th>
        </tr>
    </thead>

    <tbody id="ivm-sortable">
        <?php foreach($items as $item):?>

            <?php
                $class = $item->isHidden() || $item->isUnpublished() ? "ivm-is-hidden" : "";
            ?>

            <tr class="ivm-ajax-parent <?= $class ?>" data-sort='<?= $item->sort ?>' data-id='<?= $item->id ?>' class="<?= $class ?>">

                <td class="uk-table-shrink">
                    <div class="handle">
                        <i class='fa fa-bars'></i>
                    </div>
                </td>

                <td>
                    <a href="<?= $helper->pageEditLink($item->id) ?>">
                        <?= $item->title ?>
                    </a>
                </td>

                <td class="uk-text-muted uk-visible@m">
                    <em><?= $item->link_block->link_type->title ?></em>
                </td>

                <td class="uk-text-muted uk-text-small">
                    <?php
                        if($item->link_block->link_type == '3' && !empty($item->link_block->select_page)) {
                            $page_link = $this->pages->get("id={$item->link_block->select_page}");
                            if($page_link->parent->id == "3") {
                                echo "/{$page_link->name}/";
                            } else {
                                echo "/{$page_link->parent->name}/{$page_link->name}/";
                            }
                        } else {
                            echo "-";
                        }
                    ?>
                    <?= ($item->link_block->link_type == "2") ? "<em>{$item->link_block->link}</em>" : ""; ?>
                </td>

                <td class="uk-text-center uk-text-muted uk-visible@m">
                    <?= ($item->menu && $item->menu->count) ? $item->menu->count : "-"; ?>
                </td>

                <td class="uk-text-right">

                    <?php
                        $tooltip = $item->isUnpublished() ? "Publish" : "Unpublish";
                    ?>

                    <a href="#" class="ivm-ajax-button" title="<?= $tooltip ?>" uk-tooltip
                        data-id="<?= $item->id ?>"
                        data-action="publish"
                    >
                        <i class="fa fa-toggle-on"></i>
                    </a>

                    <a href="<?= $page->url ?>?admin_action=trash&id=<?= $item->id ?>" title="Trash" uk-tooltip>
                        <i class="fa fa-close"></i>
                    </a>

                </td>

            </tr>

        <?php endforeach;?>
    </tbody>

</table>

<?php
if($items->count < 1) echo "<div class='uk-padding'><h3 class='uk-margin-remove'>No items to display</h3></div>";
?>
