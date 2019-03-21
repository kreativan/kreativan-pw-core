<?php
/**
 *  Google Map Markup
 *  Display google map by providing lat and lng or by address.
 *  If lat and lng are provided, address will be ignored, 
 *  otherwise adddress will be used to center the map.
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2019 Kreativan
 *  
 *  @var id
 * 
 *  @var address   string
 *  @var lat       string 
 *  @var lng       string
 * 
 *  @var zoom      string/integer
 *  @var height    integer
 *  
 *  @var icon      image url
 *  @var style     map style file name 
 * 
*/

$address        = !empty($address) ? $address : setting("siteAddress");
$lat            = !empty($lat) ? $lat : "";
$lng            = !empty($lng) ? $lng : "";

$zoom           = !empty($zoom) ? $zoom : "14";
$height         = !empty($height) ? $height : "400";

$icon           = !empty($icon) ? $icon : "";
$style          = !empty($style) ? $style : "";

$id             = !empty($id) ?  $id : "map";

?>

<div class="tm-google-map">

    <script>
    
        /**
         *  Run initMap callback on window load.
         *  Callback is defined on google maps api script url 
         * 
         */
        window.initMap = function(){

            /**
             *  Init Google Map
             *  Run this fucntion to init the map. You need to provide lat and lng.
             *  @var myLat       
             *  @var myLng
             *
             */
            function initGoogleMap(myLat, myLng) {

                var location = {lat: myLat, lng: myLng};

                var map = new google.maps.Map(document.getElementById('<?= $id ?>'), {
                    center: location,
                    zoom: <?= $zoom ?>,
                    draggable: true,
                    scrollwheel: false,
                    fullscreenControl:true,
                    zoomControl: true,
                    mapTypeControl: true,
                    streetViewControl: true,
                    <?php if($style != "" && $style != "default"):?>
                        styles: <?php include("./../lib/map-styles/{$style}.php");?>
                    <?php endif;?>
                });
                var marker = new google.maps.Marker({
                    position: location,
                    map: map,
                    <?php if($icon != ""):?>
                        icon: '<?= $icon ?>',
                    <?php endif;?>
                });

            }

            /**
             *  Init Google Map By Address
             *  Get @var lat and @var lng using google geocoder.
             *  Then run the @function initGoogleMap() to init the map with resulting lat and lng
             *
             */
            function initMapByAddress(my_address) {

                var geocoder;
                geocoder = new google.maps.Geocoder();

                geocoder.geocode({'address': my_address}, function(results, status) {

                    if (status == 'OK') {
                        thisLat = results[0].geometry.location.lat();
                        thisLng = results[0].geometry.location.lng();
                        initGoogleMap(thisLat, thisLng); // run the function with the data we got
                    } else {
                        console.log('Geocode was not successful for the following reason: ' + status);
                    }

                });

            }

            <?php if($lat != "" && $lng != "") :?>
                initGoogleMap(<?= $lat ?>, <?= $lng ?>);
            <?php else :?>
                initMapByAddress("<?= $address ?>");
            <?php endif;?>    

        }
    </script>

    <div id="<?= $id ?>" style="height:<?= $height ?>px;width:100%;"></div>
    
</div>