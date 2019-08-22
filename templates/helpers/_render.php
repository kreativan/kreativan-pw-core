<?php
/**
 *  Render Functions
 *
 *  renderPagination()
 *  renderBreadcrumb()
 *	renderAlert()
 *	renderButton()
 *	renderLinkBlock()
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


/**
 *  Render LInk Block
 * 
 */
function renderLinkBlock($link_block, $title = "", $class = "") {

    $link_type  = $link_block->link_type;
    $page_link  = $link_block->select_page;
    $link       = $link_block->link;
    $link_attr  = $link_block->link_attr;

    $href   = "#";
    $attr   = "";
    $span   = "";

    if ($link_type == "3" && !empty($page_link)) {
        $p = wire("pages")->get("id=$page_link");
        $href = $p->url;
    } else {
        $href = $link;
        $attr .= ($link_attr[1]) ? " target='_blank'" : "";
        $attr .= ($link_attr[2]) ? " rel='nofollow'" : "";
        $attr .= ($link_attr[3]) ? " uk-toggle" : "";
        // scroll
        $attr .= ($link_attr[4]) ? " uk-scroll" : "";
    }

    $attr .= !empty($title) ? " title='$menu->title'" : "";
 
    /**
     *   if link_type is page, check selected page_link for access permission,
     *   if not, check "home page" for access permission, (access is granted).
     *
     *   To check if page is viewable use: <?php if($pageAccess->viewable()) : ?>
     *   Note: PAGE_LINK TEMPLATE MUST HAVE TEMPLATE FILE, if not item won't be visible
     *
     */
    $pageAccess = "";
    $pageAccess = wire("pages")->get("/");
    if($link_type == '3' && !empty($page_link)) {
        $pageAccess = wire("pages")->get("id=$page_link");
    }

    if($link_type != "1" && $pageAccess->viewable()) {
        return "<a class='$class' href='$href' $attr>$title</a>";
    }

}