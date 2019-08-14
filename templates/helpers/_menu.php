<?php
/**
 *  This will get link option from link_block field
 *  @param Page|Repeater $menu
 *  @return array
 */
function getLinkOptions($menu) {

    $home = wire("pages")->get("/");

    $link_type  = $menu->link_block->link_type;
    $page_link  = $menu->link_block->select_page;
    $link       = $menu->link_block->link;
    $link_attr  = $menu->link_block->link_attr;

    $href   = "#";
    $attr   = "";
    $class  = "";
    $span   = "";

    // Featured
    $class .= $menu->featured ? "tm-featured " : "";

    // Parent class
    $class .= ($menu->menu && $menu->menu->count) ? " uk-parent" : "";

    // link_type + href + attr
    if ($link_type == "2" && !empty($page_link)) {
        $p = wire("pages")->get("id=$page_link");
        $href = $p->url;
        $class .= ($p->id == wire("page")->id) ? "uk-active" : "";
    } else {
        $href = $link;
        $attr .= ($link_attr[1]) ? " target='_blank'" : "";
        $attr .= ($link_attr[2]) ? " rel='nofollow'" : "";
        $attr .= ($link_attr[3]) ? " uk-toggle" : "";
        // scroll
        $attr .= (wire("page") == $home && $link_attr[4]) ? " uk-scroll" : "";
        // if not home go to home page and scroll
        $href = (wire("page") != $home && $link_attr[4]) ? "{$home->url}{$link}" : $href;
    }

    // link title attr
    $attr .= " title='$menu->title'";

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
    if($link_type == '2' && !empty($page_link)) {
        $pageAccess = wire("pages")->get("id=$page_link");
    }

    $options = [
        "pageAccess" => $pageAccess->viewable(),
        "class" => $class,
        "href" => $href,
        "attr" => $attr
    ];

    return $options;

}

/**
 *  This will render menu item <li>
 *  using getLinkOptions() function
 *  @param Page|Repeater $menu
 *  @return string|html
 */
function renderMenuItem($menu) {

    $html = false;
    $options = getLinkOptions($menu);

    if($options["pageAccess"]) {
        $html = "<li class='{$options['class']}'>";
        $html .= "<a href='{$options['href']}' {$options['attr']}>{$menu->title}</a>";
        $html .= "</li>";
    }

    return $html;

}

/**
 *  Render dropdown
 *  @param Repeater|Page $dropdown
 *  @return string|html
 */
function renderDropdown($dropdown) {
    $html = "<div class='uk-navbar-dropdown'>";
    $html .= "<ul class='uk-nav uk-navbar-dropdown-nav'>";
    foreach($dropdown as $menu) $html .= renderMenuItem($menu);
    $html .= "</ul></div>";
    return $html;
}

/**
 *  This will render navbar item <li> with dropdown
 *  using getLinkOptions() function
 *  @param Page|Repeater $menu
 *  @return string|html
 */
function renderNavbarItem($menu) {

    $html = false;
    $options = getLinkOptions($menu);
    $dropdown = $menu->menu;

    if($options["pageAccess"]) {
        $html = "<li class='{$options['class']}'>";
        $html .= "<a href='{$options['href']}' {$options['attr']}>{$menu->title}</a>";
        if($dropdown && $dropdown->count) {
            $html .= renderDropdown($dropdown);
        }
        $html .= "</li>";
    }

    return $html;

}

/**
 *  This will render Nav item <li> with subnav
 *  @param Page|Repeater $menu
 *  @return string|html
 */
function renderNavItem($menu) {
    $options = getLinkOptions($menu);
    $subnav = $menu->menu;
    $class = $subnav && $subnav->count ? "uk-parent {$options["class"]}" : $options["class"];
    $html = "<li class='$class'>";
    $html .= "<a href='{$options['href']}' {$options['attr']}>{$menu->title}</a>";
    if($subnav && $subnav->count) {
        $html .= "<ul class='uk-nav-sub'>";
        foreach ($subnav as $item) $html .= renderMenuItem($item);
        $html .= "</ul>";
    }
    $html .= "</li>";
    return $html;
}

/**
 *  Render Subnav
 *  @var Page $menu     menu child pages or repeater, with a link_block field
 *  @var string $align  left/right/center
 *  @var string $class  uikit subnav class
 *
 */
function renderSubnav($menu, $align = "center", $class = "uk-subnav-divider") {

    $html = "<ul class='uk-subnav $class uk-flex-$align'>";
    foreach($menu as $item) {
        $html .= renderMenuItem($item);
    }
    $html .= "</ul>";

    return $html;

}


/**
 *  Render Full Mobile Menu
 *  @param PageArray $mobile_menu  eg: $page->children();
 *  @param string $align 
 *  @param bool $v_align
 *  @param bool $home show home link
 */
function renderMobileMenu($mobile_menu, $align = "center", $v_align = true, $home = true) {

    $v_align = $v_align == true ? "uk-margin-auto-vertical" : "";

    // Start
    $html = "<ul class='uk-nav uk-nav-primary uk-nav-$align $v_align' uk-nav>";

    // Home link
    if($home == true) {
        $class = (wire("page")->id == "1") ? 'uk-active' : '';
        $href = wire("pages")->get("/")->url;
        $title = wire("pages")->get("/")->title;
        $html .= "<li class='$class'>";
        $html .= "<a href='$href'>$title</a>";
        $html .= "</li>";
    }

    // Menu Items
    foreach ($mobile_menu as $menu) $html .= renderNavItem($menu);

    $html .= "</ul>";

    return $html;

}


/**
 *  Render Main Navbar Menu
 *  @param PageArray $navbar eg: $page->children("include=hidden, sort=sort");
 *  @param bool $home
 */
function renderNavbarMenu($navbar, $home = true) {

    // Start
    $html = "<ul class='uk-navbar-nav'>";

    // Home link
    if($home == true) {
        $class = (wire("page")->id == "1") ? 'uk-active' : '';
        $href = wire("pages")->get("/")->url;
        $title = wire("pages")->get("/")->title;
        $html .= "<li class='$class'>";
        $html .= "<a href='$href'>$title</a>";
        $html .= "</li>";
    }

    // Navbar Items
    foreach ($navbar as $menu) $html .= renderNavbarItem($menu);

    return $html;

}