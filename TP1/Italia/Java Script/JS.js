
function closee() {
    document.getElementById('close').style.display = "none";
    document.getElementById('map').style.display = "none";

}
function displayMap() {
    document.getElementById('map').style.display = "block";
    document.getElementById('close').style.display = "block";
    initMap();
}
function initMap() {

    var options = {
        center: new google.maps.LatLng(43.087619, 12.307855),
        zoom: 7,

    }
    map = new google.maps.Map(document.getElementById('map'), options);

}



