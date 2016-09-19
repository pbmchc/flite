function initialize(flight) {
 
    var json = JSON.parse(flight);
    var flitepoints = json.Points;
    var pilots = json.Pilots;

    var flightPlanCoordinates = [];
    var index;

    var contener = document.getElementById("contener");
    contener.style.visibility = "visible";
    var samolot = document.getElementById("samolot");
    samolot.innerText = json.Plane;
    var przewoznik = document.getElementById("przewoznik");
    przewoznik.innerText = json.Company;
    var czasTrwania = document.getElementById("czasTrwania");
    czasTrwania.innerText = json.Time;
    var kodLotu = document.getElementById("kodLotu");
    kodLotu.innerText = json.Code;
    var piloci = document.getElementById("piloci");
    piloci.innerText = pilots[0].FullName + ", " + pilots[1].FullName;
    var center = Math.ceil(flitepoints.length / 2);

    var mapOptions = {
        zoom: 6,
        center: new google.maps.LatLng(flitepoints[center].Latitude, flitepoints[center].Longitude),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    var map = new google.maps.Map(document.getElementById("googleMap"),
        mapOptions);


    for (index = 0; index < flitepoints.length; ++index) {
        var fpoint = flitepoints[index];
        flightPlanCoordinates.push(new google.maps.LatLng(fpoint.Latitude, fpoint.Longitude));
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(fpoint.Latitude, fpoint.Longitude),
            map: map,
            icon: "flyico.png",
            title: fpoint.Name           
        });
        google.maps.event.addListener(marker, 'click', show(fpoint));      
    }

    function show(fpoint) {
        return function () {
            var overlay = document.getElementById('overlay');
            var content = document.getElementById('overlayContent');
            document.getElementById('pointName').innerText = fpoint.Name;
            document.getElementById('pointFreq').innerText = String(fpoint.Frequency);
            document.getElementById('pointHeight').innerText = prettify(fpoint.Height) +"m";
            document.getElementById('pointTime').innerText = fpoint.Time;
            document.getElementById('pointTimeRem').innerText = fpoint.RemainingTime;
            unfade(overlay, 0.4);
            unfade(content, 1);
        };
    }

    function prettify(height)
    {
        var h = String(height);
        var end = h.substr(h.length - 3, h.length);
        var beg = h.substr(0, h.length - 3);
        var pretty = beg + " " + end;
        return pretty;
    }

    function unfade(element, target) {
        var op = 0.1;
        element.style.display = 'block';
        var timer = setInterval(function () {
            if (op >= target) {
                clearInterval(timer);
            }
            element.style.opacity = op;
            element.style.filter = 'alpha(opacity=' + op * 300 + ")";
            op += op * 0.3;
        }, 10);
    }

    var flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 2
    });

    flightPath.setMap(map);
}