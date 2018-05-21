<?php
/**
 *  Google Map
 *
 *  @author Ivan Milincic <lokomotivan@gmail.com>
 *  @copyright 2017 Ivan Milincic
 *
 *  @var pageObj
 *  @var custom_map_height
 *
*/

$p              = !empty($pageObj) ? $pageObj : $page;
$lat            = $p->map->lat;
$lng            = $p->map->lng;
$zoom           = $p->map->zoom;
$map_address    = $p->map->address;
$info_window    = $p->map->address;

$map_height = !empty($custom_map_height) ? $custom_map_height : "400";

?>

<div class="google-map">

    <script>
        window.initMap = function(){
            var location = {lat: <?= $lat ?>, lng: <?= $lng ?>};
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: <?= $zoom ?>,
                draggable: true,
                scrollwheel: false,
                fullscreenControl:true,
                zoomControl: true,
                mapTypeControl: true,
                streetViewControl: true,
                center: location,
                <?php if(!empty($page->map_style)):?>
                    styles: <?php include("./../lib/map-styles/{$page->map_style->title}.php");?>
                <?php endif;?>
            });
            var marker = new google.maps.Marker({
                position: location,
                map: map,
                <?php if($page->logo && $page->logo != ""):?>
                    icon: '<?= $page->logo->height(64)->url ?>',
               <?php endif;?>
            });

        }
    </script>

    <div id="map" style="height:<?= $map_height ?>px;width:100%;"></div>
    
</div>
