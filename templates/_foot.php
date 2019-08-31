

	<footer id="footer" class="uk-background-secondary uk-light uk-padding-large uk-text-center">
		<div class="uk-container">

			<a class="uk-animation-slide-bottom uk-visible@l" href="#" uk-totop uk-scroll></a>

			<p>
				<?php
					$copyright = $site_settings->text;
					$copyright = str_replace("{{date}}", date("Y"), $copyright);
					$copyright = str_replace("{{site_name}}", setting("site_name"), $copyright);
					$website = "<a href='".setting("site_webite")."'>".setting("site_name")."</a>";
					$copyright = str_replace("{{website}}", $website, $copyright);
					echo $copyright;
				?>
			</p>

		</div>
	</footer>

</div> <!-- wrapper end -->

<?php
    // Dynamic js/css files
    foreach($config->styles->unique() as $file) {
    	echo "<link rel='stylesheet' type='text/css' href='$file' />";
    }
    foreach($config->scripts->unique() as $file) {
    	echo "<script type='text/javascript' src='$file'></script>";
    }
?>

<?php
	if(!empty($site_settings->google_analytics)) {
		echo $site_settings->google_analytics;
	}
?>

</body>
</html>
