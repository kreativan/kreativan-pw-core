<!DOCTYPE html>
<html lang="en">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- favicon -->
	<?php if(!empty($site_settings->favicon)): ?>
	    <link rel="shortcut icon" type="image/ico" href="<?= $site_settings->favicon->url ?>" />
	    <link rel="apple-touch-icon-precomposed" href="<?= $site_settings->favicon->url ?>" />
	<?php endif ?>

	<!-- less -->
	<link rel="stylesheet" type="text/css" href="<?php echo AIOM::CSS('less/theme.less');  ?>">

	<!-- uikit -->
	<script type='text/javascript' src='<?=  $config->urls->templates . 'lib/uikit/js/uikit.min.js' ; ?>'></script>
	<script type='text/javascript' src='<?=  $config->urls->templates . 'lib/uikit/js/uikit-icons.min.js' ; ?>'></script>

	<!-- Font Awesome -->
	<link href="<?= $config->urls->templates ?>lib/fontawesome-free/css/all.css" rel="stylesheet">

	<!-- main js -->
	<script defer type='text/javascript' src='<?=  $config->urls->templates . 'lib/main.js' ; ?>'></script>

	<!-- Google Maps -->
    <script defer src="https://maps.googleapis.com/maps/api/js?key=<?= $modules->get("FieldtypeMapMarker")->googleApiKey ?>&callback=initMap"></script>

	<?php
		// SeoMaestro
		echo $page->seo;
	?>

</head>

<body class="<?= $page->template ?>-tmpl">

<?php
	$files->include($config->paths->templates."markup/mobile-header.php");
?>

<div id="wrapper" class="uk-offcanvas-content">

	<div id="header" class="uk-visible@m">
		<div id="navbar" uk-sticky="show-on-up: true; animation: uk-animation-slide-top;">
			<div class="uk-container">
				<nav class="uk-navbar-container" uk-navbar="boundary: body">

					<div class="uk-navbar-left">
						<div id="logo" class="logo uk-width-auto">
							<?php if(!empty($site_settings->logo)) :?>
								<a href="<?= $pages->get(1)->url ?>">
									<img src="<?= $site_settings->logo->url ?>" alt="logo" />
								</a>
							<?php else :?>
								<h3 class="uk-margin-remove"><?= setting("site_name"); ?></h3>
							<?php endif;?>
						</div>
					</div>

					<div class="uk-navbar-center">
						<?php
							$main_menu = $pages->get("/system/main-menu/")->children("include=hidden, sort=sort");
							echo renderNavbarMenu($main_menu, setting("show_home"));
						?>
					</div>

				</nav>
			</div>
		</div>
	</div>
