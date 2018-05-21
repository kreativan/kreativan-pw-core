<?php
include('./_head.php'); // include header markup
?>

<section class="uk-section">
	<div class="uk-container">
		<?php

			// output 'headline' if available, otherwise 'title'
			echo "<h1>" . $page->get('headline|title') . "</h1>";

			// output bodycopy
			echo $page->body;

			// render navigation to child pages
			renderNav($page->children);

		?>
	</div><!-- end content -->
</section>

<?php
include('./_foot.php'); // include footer markup
?>
