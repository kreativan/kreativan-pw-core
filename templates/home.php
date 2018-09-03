<?php
include('./_head.php'); // include header markup
?>

<section class="uk-section">
	<div class="uk-container">
		<?php

			// output 'headline' if available, otherwise 'title'
			echo "<h1>" . $page->get('headline|title') . "</h1>";

			foreach($page->buttons as $item) {
				echo renderButton($item->button);
			}

			// output bodycopy
			echo $page->body;

		?>
	</div><!-- end content -->
</section>

<?php
include('./_foot.php'); // include footer markup
?>
