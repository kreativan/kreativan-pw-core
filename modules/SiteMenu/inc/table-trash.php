<?php
/**
 *  Table Trash Admin UI
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *  @var PageArray $items
 *
*/


?>

<table class="ivm-table uk-table uk-table-striped uk-table-middle uk-table-small uk-margin-remove">

    <thead>
        <tr>
            <th>Title</th>
            <th>Link Type</th>
            <th>Link</th>
            <th class="uk-text-center">Dropdown</th>
            <th></th>
        </tr>
    </thead>

    <tbody>
        <?php foreach($items_trash as $item):?>
            <tr class="ivm-ajax-parent">

                <td>
                    <a class="uk-text-danger" href="<?= $helper->pageEditLink($item->id) ?>">
                        <?= $item->title ?>
                    </a>
                </td>

                <td class="uk-text-muted">
                    <em><?= $item->link_block->link_type->title ?></em>
                </td>

                <td class="uk-text-muted uk-text-small">
                    <?php
                        if($item->link_block->link_type == '2' && !empty($item->link_block->select_page)) {
                            $page_link = $this->pages->get("id={$item->link_block->select_page}");
                            if($page_link->parent->id == "1") {
                                echo "/{$page_link->name}/";
                            } else {
                                echo "/{$page_link->parent->name}/{$page_link->name}/";
                            }
                        }
                    ?>
                    <?= ($item->link_block->link_type == '3') ? "<em>{$item->link_block->link}</em>" : ""; ?>
                </td>

                <td class="uk-text-center uk-text-muted">
                    <?= ($item->menu->count) ? $item->menu->count : "-"; ?>
                </td>

                <td class="uk-text-right">

                    <a href="<?= $page->url ?>?admin_action=restore&id=<?= $item->id ?>" title="Restore" uk-tooltip>
                        <i class="fa fa-refresh uk-text-primary"></i>
                    </a>

                    <a href="#" class="ivm-ajax-button uk-text-danger" title="Delete" uk-tooltip
                        data-id="<?= $item->id ?>"
                        data-action="delete"
                    >
                        <i class="fa fa-trash"></i>
                    </a>


                </td>

            </tr>
        <?php endforeach;?>
    </tbody>

</table>
