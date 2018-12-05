

	<footer id="footer" class="uk-background-secondary uk-light uk-padding-large uk-text-center">
		<div class="uk-container">

			<!-- scroll to top -->
			<a class="uk-animation-slide-bottom uk-visible@l" href="#" uk-totop uk-scroll></a>

			<p>
				<?php
					$site_name = $site_info->site_name;
					$website = "<a href='{$site_info->website}'>$site_name</a>";
					$copyright = str_replace("{{date}}", date("Y"), $site_settings->text);
					$copyright = str_replace("{{site_name}}", $site_name, $copyright);
					$copyright = str_replace("{{website}}", $website, $copyright);
					echo $copyright;
				?>
			</p>

		</div>
	</footer>


	<?php
		if(!empty($system->google_analytics)) {
			echo $system->google_analytics;
		}
	?>

	<?php
    	// Dynamic js/css files
    	foreach($config->styles->unique() as $file) {
    		echo "<link rel='stylesheet' type='text/css' href='$file' />";
    	}
    	foreach($config->scripts->unique() as $file) {
    		echo "<script type='text/javascript' src='$file'></script>";
    	}
    ?>

</div><!-- offcanvas content end -->
</body>
</html>
