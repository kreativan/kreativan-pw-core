<?php
include('./_head.php'); // include header markup
?>
<title>Widgets</title>

<div class="uk-section uk-section-muted uk-text-center">
    <div class="uk-container uk-container-small">

        <h1><?= $page->title ?></h1>

        <form action="./" method="GET">
            <select class="uk-select uk-form-large" name="id" onchange="this.form.submit()">
                <option value="">- Select -</option>
                <?php foreach($pages->get("template=widgets")->children() as $option):?>
                    <option value="<?= $option->id ?>" <?= ($input->get->id == $option->id) ? "selected" : "" ?>>
                        <?= $option->title ?>
                    </option>
                <?php endforeach;?>
            </select>
        </form>

    </div>
</div>


<div class="uk-section" uk-height-viewport="expand: true">
    <div class="uk-container">

        <?php
            if($input->get->id) {
                $id = $sanitizer->int($input->get->id);
                $id = $sanitizer->selectorValue($id);
                $widget = $pages->get("id=$id");
                echo renderWidget($widget);
            } else {
                echo "<h2 class='uk-text-center uk-text-muted'>Select Widget</h2>";
            }
        ?>

    </div>
</div>

<?php
include('./_foot.php'); // include footer markup
?>
