<?php
/**
 *  Review JSON-LD
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2019 kraetivan.net
 *  @link http://www.kraetivan.net
 *  @license http://www.gnu.org/licenses/gpl.html
 *
 *  @var string $item_type - eg: Product
 *  @var string $item_img
 *  @var string $item_name - Item Title
 *
 *  @var string $title - review title
 *  @var string $author - review author
 *  @var string $body - review text
 *
 *  @var string|integer $rating - 1-5
 */

$item_type = !empty($item_type) ? $item_type : "Product";
$item_img  = !empty($item_img) ? $item_img : "";
$item_name = !empty($item_name) ? $item_name : "";

$rating  = !empty($rating) ? $rating : "";
$title   = !empty($title) ? $title : "";
$author  = !empty($author) ? $author : "";
$body    = !empty($body) ? $body : "";

?>


<script type="application/ld+json">
{
    "@context": "https://schema.org/",
    "@type": "Review",
    "itemReviewed": {
        "@type": "<?= $item_type ?>",
        <?php if ($item_img != ""): ?>
            "image" : "<?= $item_img ?>",
        <?php endif; ?>
        <?php if ($item_img != ""): ?>
            "name" : "<?= $item_name ?>",
        <?php endif; ?>
    },
    <?php if ($rating != ""): ?>
        "reviewRating" : {
            "@type": "Rating",
            "bestRating": "5",
            "ratingValue": "<?= $rating ?>",
            "worstRating": "1"
        },
    <?php endif; ?>
    <?php if ($title != ""): ?>
        "name" : "<?= $title ?>",
    <?php endif;?>
    <?php if ($author != ""): ?>
        "author" : {
            "@type": "Person",
            "name": "<?= $author ?>"
        },
    <?php endif;?>
    <?php if ($body != ""): ?>
        "reviewBody" : "<?= $body ?>",
     <?php endif;?>
    "publisher": {
        "@type": "Organization",
        "name": "<?= setting("site_name") ?>"
    }
}
</script>
