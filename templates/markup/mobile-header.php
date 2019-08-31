<?php
/**
 *  Mobile Header view.php
 *
 *
*/

$mobile_menu = $pages->get("/system/main-menu/")->children("include=hidden, sort=sort");

$mobile_menu_style = $modules->get("SiteMenu")->mobile_menu_style;

switch ($mobile_menu_style) {
    case '1':
        $href = "#";
        $toggle = "uk-toggle='target: #mobile-header, #mobile-menu-drop; cls: uk-open'";
        $sticky = "";
        break;
    case '2':
        $href = "#mobile-menu";
        $toggle = "uk-toggle";
        $sticky = "uk-sticky";
        break;
    default:
        # code...
        break;
}

?>

<div id="mobile-header" class="uk-hidden@m uk-flex uk-flex-center uk-flex-middle" <?= $sticky ?>>

    <a class="mobile-menu-button uk-position-center-left uk-padding-small uk-padding-remove-vertical" href="<?= $href ?>" <?= $toggle ?>>
        <span class="tm-open" uk-icon="icon: menu; ratio: 1.3"></span>
        <span class="tm-close" uk-icon="icon: close; ratio: 1.3"></span>
    </a>

    <a class="mobile-logo" href="<?= $pages->get("/")->url ?>">
        <?php if(!empty($site_settings->logo) || !empty($site_settings->logo2)):?>
            <?php
                $mobile_logo = !empty($site_settings->logo2) ? $site_settings->logo2->url : $site_settings->logo->url;
            ?>
            <img src="<?= $mobile_logo ?>" alt="<?= setting("site_name") ?>" />
        <?php else: ?>
            <div class="uk-h4 uk-margin-remove uk-inline">
                <?= setting("site_name") ?>
            </div>
        <?php endif;?>
    </a>

</div>

<?php if($mobile_menu_style == "1") :?>
    <div id="mobile-menu-drop" class="uk-hidden@m">

        <?= renderMobileMenu($mobile_menu, "left", false);?>

        <div class="uk-flex uk-flex-between uk-text-small">
            <div class="tm-text-700"><?= setting("site_name") ?></div>
        </div>

    </div>
<?php elseif($mobile_menu_style == "2") :?>
    <div id="mobile-menu" uk-offcanvas="overlay: true">
        <div class="uk-offcanvas-bar uk-flex uk-flex-column">

            <button class="uk-offcanvas-close" type="button" uk-close></button>
            <?= renderMobileMenu($mobile_menu, "center", true); ?>

        </div>
    </div>
<?php endif;?>
