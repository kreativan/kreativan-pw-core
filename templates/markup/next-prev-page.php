<?php
/**
 *  Next Prev pages markup
 *
 *  @var Page|object $page
 *  @var string $text_field - field to be used as text
 *  @var string $sort
 *
*/

$text_field = !empty($text_field ) ? $text_field : "text";
$sort = !empty($sort) ? $sort : "sort";

$next_page = $page->next("sort=$sort");
$prev_page = $page->prev("sort=$sort");

$prev = !empty($prev_page) && ($prev_page != "") && ($page->template == $prev_page->template) ? true: false;
$next = !empty($next_page) && ($next_page != "" && ($page->template == $next_page->template)) ? true: false;

?>

<?php if($prev == true || $next == true) :?>

    <div class="tm-article-next-prev uk-margin-medium">
        <div class="uk-child-width-expand@m" uk-grid>

            <div>
                <h3 class="tm-heading-link uk-h5 uk-margin-remove">
                    <a href='<?= $prev_page->url ?>' title="<?= $prev_page->title ?>">
                        <?php if($prev == true) :?>
                            <i class="fas fa-arrow-left"></i>
                        <?php endif;?>
                        <?= $sanitizer->truncate($prev_page->title, "40") ?>
                    </a>
                </h3>
                <?php if($prev_page->{$text_field} && !empty($prev_page->{$text_field})) :?>
                    <p class="uk-text-small uk-margin-small">
                        <?= $sanitizer->truncate($prev_page->{$text_field}, "100") ?>
                    </p>
                <?php endif;?>
            </div>

            <div class="uk-text-right">
                <h3 class="tm-heading-link uk-h5 uk-margin-remove">
                    <a href='<?= $next_page->url ?>' title="<?= $next_page->title ?>">
                        <?= $sanitizer->truncate($next_page->title, "40") ?>
                        <?php if($next == true) :?>
                            <i class="fas fa-arrow-right"></i>
                        <?php endif;?>
                    </a>
                </h3>
                <?php if($next_page->{$text_field} && !empty($next_page->{$text_field})) :?>
                    <p class="uk-text-small uk-margin-small">
                        <?= $sanitizer->truncate($next_page->{$text_field}, "100") ?>
                    </p>
                <?php endif;?>
            </div>
        </div>
    </div>
<?php endif;?>
