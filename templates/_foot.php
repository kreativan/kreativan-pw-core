

	<footer id="footer" class="uk-background-secondary uk-light uk-padding-large uk-text-center">
		<div class="uk-container">

			<!-- scroll to top -->
			<a class="uk-animation-slide-bottom uk-visible@l" href="#" uk-totop uk-scroll></a>

			<p>
				Copyright © <?= date("Y"); ?> <a href="<?= $system->site_info->website ?>" target="_blank"><?= $system->site_info->site_name ?></a>
			</p>

		</div>
	</footer>


	<?php
		if(!empty($system->google_analytics)) {
			echo $system->google_analytics;
		}
	?>

</body>
</html>
