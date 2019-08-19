<?php
/**
 *  Grid Size
 *
 *  @param Field $optionField
 *  @example gridSize($item->grid_size);
 *
 */

function gridSize($optionField) {

    switch ($optionField) {
        case '1':
            $grid_size = "expand";
            break;
        case '2':
            $grid_size = "auto";
            break;
        case '3':
            $grid_size = "1-5";
            break;
        case '4':
            $grid_size = "1-3";
            break;
        case '5':
            $grid_size = "2-5";
            break;
        case '6':
            $grid_size = "1-2";
            break;
        case '7':
            $grid_size = "3-5";
            break;
        case '8':
            $grid_size = "2-3";
            break;
        case '9':
            $grid_size = "4-5";
            break;
        case '10':
            $grid_size = "1-1";
            break;
        default:
            $grid_size = "expand";
    }

    return $grid_size;

}


/**
 *  Items per Row
 *
 *  @param Field $optionField
 *  @example itemsPerRow($item->items_per_row);
 *
 */
function itemsPerRow($optionField) {

	if($optionField->title == "expand") {
		$items_per_row = "expand";
	}else {
		$items_per_row = "1-{$optionField->title}";
	}

    return $items_per_row;

}