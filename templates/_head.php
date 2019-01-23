<?php
/**
 *  Head
 *
 *  @author Ivan Milincic <lokomotivan@gmail.com>
 *  @copyright 2018 Ivan Milincic
 *
 *
*/

?>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<?php if(empty($page->seo_title)): ?>
		<title><?= $page->title ?></title>
	<?php endif;?>

	<!-- favicon -->
	<?php if(!empty($system->favicon)): ?>
	    <link rel="shortcut icon" type="image/ico" href="<?= $system->favicon->url ?>" />
	    <link rel="apple-touch-icon-precomposed" href="<?= $system->favicon->url ?>" />
	<?php endif ?>

	<!-- jquery
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	-->

	<!-- less -->
	<link rel="stylesheet" type="text/css" href="<?php echo AIOM::CSS('less/theme.less');  ?>">

	<!-- uikit -->
	<script type='text/javascript' src='<?=  $config->urls->templates . 'lib/uikit/js/uikit.min.js' ; ?>'></script>
	<script type='text/javascript' src='<?=  $config->urls->templates . 'lib/uikit/js/uikit-icons.min.js' ; ?>'></script>

	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

	<!-- main js -->
	<script defer type='text/javascript' src='<?=  $config->urls->templates . 'lib/main.js' ; ?>'></script>

    <!-- Google Maps -->
    <script defer src="https://maps.googleapis.com/maps/api/js?key=<?= $modules->get("FieldtypeMapMarker")->googleApiKey ?>&callback=initMap"></script>

</head>

<body>
<div class="uk-offcanvas-content">

<div id="mobile-menu" uk-offcanvas="overlay: true">
	<div class="uk-offcanvas-bar">
		<button class="uk-offcanvas-close" type="button" uk-close></button>
		<div class="uk-margin-large-top">
			<!--

				add your mobile menu here

			-->
		</div>
	</div>
</div>

<div id="mobile-header" class="uk-hidden@m">
	<a class="mobile-menu-button" href="#mobile-menu" uk-toggle><span uk-icon="icon: menu"></span></a>
	<a class="logo" href="<?= $pages->get("/")->url ?>">
		<?php if(!empty($site_settings->logo)) :?>
			<img src="<?= $site_settings->logo->url ?>" alt="logo" />
		<?php else: ?>
			<div class="uk-margin-remove uk-inline"><?= $site_info->site_name ?></div>
		<?php endif;?>
	</a>
</div>

<section id="header" class="uk-section-muted uk-visible@m">
	<div class="uk-container uk-flex uk-flex-middle">

		<div id="logo" class="logo uk-width-auto">
			<?php if(!empty($site_settings->logo)) :?>
				<a href="<?= $pages->get(1)->url ?>">
					<img src="<?= $site_settings->logo->url ?>" alt="logo" />
				</a>
			<?php else :?>
				<h3 class="uk-margin-remove"><?= $site_info->site_name ?></h3>
			<?php endif;?>
		</div>

		<div id="navbar" class="uk-width-expand uk-margin-left">
			<!--

					add your navbar - main menu here

			-->
		</div>

	</div>
</section>
