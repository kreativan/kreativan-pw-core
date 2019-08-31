<?php
/**
 *  FAQPage JSON-LD
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2019 kraetivan.net
 *  @link http://www.kraetivan.net
 *  @license http://www.gnu.org/licenses/gpl.html
 *
 *  @var array $faq
 *  $faq = [
 *      1 => ["q" => "Question", "a" => "Answer"],
 *      2 => ["q" => "Question 2", "a" => "Answer 2"],
 *  ]
 *
*/

$i = 1;

?>

<script type="application/ld+json">
{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
        <?php foreach($faq as $item) :?>
            {
                "@type": "Question",
                "name": "<?= $item['q'] ?>",
                "acceptedAnswer": {
                    "@type": "Answer",
                    "text": "<?= strip_tags($item['a']); ?>"
                }
            }<?= (count($faq) == $i++) ? "" : ","; ?>
        <?php endforeach; ?>
    ]
}
</script>
