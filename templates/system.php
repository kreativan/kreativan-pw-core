<?php
include('./_head.php'); // include header markup
?>

<title>System</title>

<div class="uk-section uk-section-muted uk-text-center">
    <h1><?= $page->title ?></h1>
</div>

<div class="uk-section">
    <div class="uk-container">

        <?php
            if($input->urlSegment1 == "contact-form") {
                $files->include($config->paths->templates."markup/contact-form.php");
            } else {
                $files->include($config->paths->templates."markup/_web-elements.php");
            }
        ?>

    </div>
</div>

<?php
include('./_foot.php'); // include footer markup
?>
