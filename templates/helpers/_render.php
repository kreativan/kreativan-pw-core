<?php
/**
 *  Render Functions
 *
 *  renderPagination()
 *  renderBreadcrumb()
 *  renderMenu(
 *	renderAlert()
 *	renderButton()
 *
*/


/**
 *  Pagination
 *  @param PageArray $p
 *  @example  renderPagination($page->children());
 *
 */
function renderPagination($p = "", $align = "left") {

    if($p && $p != "") {

        $pagination = $p->renderPager(array(
            'nextItemLabel'                 => "Next",
            'previousItemLabel'             => "Prev",
            'nextItemClass'                 => "pagination-next",
            'previousItemClass'             => "pagination-prev",
            'lastItemClass'                 => "pagination-last",
            'currentItemClass'              => "uk-active",
            'listMarkup'                    => "<ul class='uk-pagination uk-flex-$align'>{out}</ul>",
            'itemMarkup'                    => "<li class='{class}'>{out}</li>",
            'linkMarkup'                    => "<a href='{url}'><span>{out}</span></a>"
        ));

        if($pagination && $pagination != "") {
            return $pagination;
        }

    }

}


/**
 *  Breadcrumb
 *	@param string $align    left|center|right
 *  @example renderBreadcrumb("center");
 *
 */

function renderBreadcrumb($align = "center") {

    $breadcrumb = "<ul class='uk-breadcrumb uk-flex-$align uk-margin uk-visible@m'>";
        foreach(wire("page")->parents() as $item) {
            $breadcrumb .= "<li><a href='$item->url'>$item->title</a></li>";
        }
        $breadcrumb .= "<li class='uk-active'><span>".wire('page')->title."</span></li>";
    $breadcrumb .= "</ul>";

    return $breadcrumb;
}

/**
 *  Menu - Nav
 *
 *  @param Field $menu repeater
 *  @param string $class uikit nav class
 *
 */
function renderMenu($menu, $class = "") {

    $menu_nav = "";
    $menu_nav .= "<ul class='uk-nav $class'>";
        foreach($menu as $nav) {

            $active_cls = "";

            // attributes
            $attr = "";
            $attr .= ($nav->link_attr[1]) ? " target='_blank'" : "";
            $attr .= ($nav->link_attr[2]) ? " rel='nofollow'" : "";

            // href
            $href = "#";
            if($nav->link_type->title == "default") {

                $href = $nav->link;

            } elseif($nav->link_type->title == "page" && !empty($nav->select_page)) {

                $href = $nav->select_page->url;

                $active_cls = (wire('page')->id == $nav->select_page->id) ? "class='uk-active'" : "";

            }

            $menu_nav .= "<li {$active_cls}><a href='$href' $attr>$nav->title</a></li>";

        }
    $menu_nav .= "</ul>";

    return $menu_nav;

}


/**
 *  Display UIkit alert
 *  @var string $style  primary/success/warning/danger
 *  @var string $text  
 *
 */
function renderAlert($style = "primary", $text = "") {

    $ukAlert = "
        <div class='uk-alert-$style' uk-alert>
            <a class='uk-alert-close' uk-close></a>
            <p>$text</p>
        </div>
    ";

   if(!empty($text)) return $ukAlert;

}


/**
 *  Button
 *
 *	@param Field $b button FieldSetPage field
 *	@example renderButton($page->button)
 *
 */
function renderButton($b, $class = "") {
	$button = "";

	$class = !empty($class) ? $class : "";
   	// attributes
   	$attr = "";
   	$attr .= ($b->link_attr[1]) ? " target='_blank'" : "";
   	$attr .= ($b->link_attr[2]) ? " rel='nofollow'" : "";
   	$attr .= " title='$b->title'";
   	// href
   	$href = "#";
   	if($b->link_type == '2') {
	   $href = $b->select_page->url;
   	} elseif($b->link_type == '1') {
	   $href = $b->link;
   	}
   	// style
   	$style = "uk-button-{$b->button_style->title}";
	if(!empty($b->title)) {
		$button = "<a class='uk-button $style $class' href='$href' $attr>$b->title</a>";
	}
   	return $button;
}
