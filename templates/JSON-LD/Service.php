<?php namespace ProcessWire;
/**
 *  Service JSON-LD
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2019 kraetivan.net
 *  @link http://www.kraetivan.net
 *  @license http://www.gnu.org/licenses/gpl.html
 *
 *  @var string $title
 *  @var string $image
 *  @var bool|string $area_served,
 *  @var string $city - required if area_served == true
 *  @var array $services eg: ["one", "two"]
 *  @var array $reviews
 *
 *  $reviews = [
 *      "1" => [
 *          "author" => "John Doe",
 *          "date" => "2019",
 *          "name" => "Review headline",
 *          "text" => "Review text",
 *          "rating" => "1-5",
 *      ],
 *      "2" => [
 *          "author" => "John Doe 2",
 *          "date" => "2019",
 *          "name" => "Review headline",
 *          "text" => "Review text",
 *          "rating" => "1-5",
 *      ]
 *  ]
 *
 */

$title          = !empty($title) ? $title : $page->title;
$image          = !empty($image) ? $image : "";

$area_served    = !empty($area_served) && $area_served == "true" ? true : false;
$city           = !empty($city) ? $city : "";

$services       = !empty($services) ? $services : "";
$reviews        = !empty($reviews) ? $reviews : "";

// Calculate Rating
$rating_count = !empty($reviews) ? count($reviews) : 0;
$rating_total = 0;
$rating_value = 0;
if(!empty($reviews) && $rating_count > 0) {
    foreach($reviews as $r) $rating_total += $r["rating"];
    $rating_value = $rating_total / $rating_count;
    $rating_value = round($rating_value, 1);
}

//

$i = 1;
$rc = 1;

?>

<script type="application/ld+json">
{
    "@context": "http://schema.org/",
    "@type": "Service",
    "serviceType": "<?= $title ?>",
    "provider": {
        "@type": "LocalBusiness",
        "name": "<?= setting('site_name') ?>",
        "image": "<?= $image ?>",
        "address": "<?= setting('site_address') ?>",
        "telephone": "<?= setting('site_phone') ?>"
    },
    <?php if($area_served == true) :?>
        "areaServed":{
            "@type": "City",
            "name": "<?= $city ?>",
            "sameAs": "https://en.wikipedia.org/wiki/<?= $city ?>"
        },
    <?php endif;?>
    <?php if($reviews != "") :?>
        "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": "<?= $rating_value ?>",
            "ratingCount": "<?= $rating_count ?>"
        },
        "review": [
            <?php foreach($reviews as $review) :?>
            {
                "@type": "Review",
                "author": "<?= $review['author'] ?>",
                "datePublished": "<?= $review['date'] ?>",
                "description": "<?= $review['text'] ?>",
                "name": "Not a happy camper",
                "reviewRating": {
                    "@type": "Rating",
                    "bestRating": "5",
                    "ratingValue": "<?= $review['rating'] ?>",
                    "worstRating": "1"
                }
            }<?= (count($reviews) == $rc++) ? "" : ","; ?>
            <?php endforeach;?>
        ]<?= ($services != "") ? "," : "" ?>
    <?php endif;?>
    <?php if($services != "") :?>
        "hasOfferCatalog": {
            "@type": "OfferCatalog",
            "name": "<?= $title ?>",
            "itemListElement": [
                <?php foreach($services as $service) :?>
                {
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "Service",
                        "name": "<?= $service ?>"
                    }
                }<?= (count($services) == $i++) ? "" : ","; ?>
                <?php endforeach; ?>
            ]
        }
    <?php endif;?>
}
</script>
