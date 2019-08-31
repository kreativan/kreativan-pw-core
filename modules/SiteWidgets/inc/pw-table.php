<?php
/**
 *  pw-table.php
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2019 kraetivan.net
 *  @link http://www.kraetivan.net
 *
 *
*/

$table = $this->modules->get('MarkupAdminDataTable');
$table->set("encodeEntities", false);
$table->set("sortable", true);
$table->set("resizable", false);
$table->set("class", "uk-table-striped uk-table-middle");
// $table->set("id", "ivm-pw-data-table");
// $table->set("caption", "PW Table Caption");

// Table Heading
$table->headerRow([
    '',
    'Title',
    'Widget',
    'Name',
    'ID',
    // ['Actions', 'uk-text-right']
]);

// Table Data
foreach($this_module->items() as $item) {

    $icon = $item->template->getIcon();
    $icon = !empty($icon) ? $icon : "html5";

    $tmpl =!empty($item->template->label) ? $item->template->label : $item->template;

    //Add Row
    $table->row(
        [
            ["<i class='fa fa-$icon fa-lg uk-margin-small-left'></i>", "uk-table-shrink"], // <td> link
            $item->title => $helper->pageEditLink($item->id),
            [$tmpl, "uk-text-small"],
            [$item->name, "uk-text-muted uk-text-small"],
            [$item->id, "uk-text-muted uk-text-small"],
            // [$helper->tableActions($item), 'uk-text-right ivm-pw-table-actions'],

        ],
        [
            "class" => $item->isUnpublished() ? "ivm-ajax-parent ivm-is-hidden" : "ivm-ajax-parent", // <tr> class
            "attrs" => ["data-id" => "$item->id"] ,// <tr> attr
        ],
    );

}


if($this_module->items()->count < 1) {
    $table->row([
        ["No items to display", "uk-h3 uk-padding uk-margin-remove"]
    ]);
}

echo $table->render();
