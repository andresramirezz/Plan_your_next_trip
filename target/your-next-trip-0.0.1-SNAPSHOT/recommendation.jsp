<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="./js/jquery.min.js" type="text/javascript"></script>
    <script src="./js/popper.min.js" type="text/javascript"></script>
    <script src="./js/bootstrap.min.js" type="text/javascript"></script>
    <script src="./js/places.js" type="text/javascript"></script>

    <link href="./css/style.css" type="text/css" rel="stylesheet">

    <style>
        body {
            background-image: url('./image/bus.jpg');
        }
    </style>

    <title>Recommend a Route | Your Next Trip</title>
</head>
<body>
<%@ include file="header.html" %>
<div class="container-fluid">
    <div class="row my-5">
        <div class="col-lg-6 col-md-12">
            <form id="geocodingInput">
                <div class="form-group">
                    <label for="sourceInput">Starting address</label>
                    <input type="text" class="form-control" id="sourceInput" placeholder="Enter an address..."/>
                </div>
                <div class="form-group">
                    <label for="destInput">Destination address</label>
                    <input type="text" class="form-control" id="destInput" placeholder="Enter an address..."/>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <div class="col-lg-4 col-md-12 offset-lg-1 offset-md-4 offset-xs-3 mt-4">
            <div id="travelTypeOutput"></div>
        </div>
    </div>
</div>
<%@ include file="footer.html" %>
<script>
    const placesAutocomplete1 = places({
        appId: <%@include file="algolia-app-id"%>,
        apiKey: <%@include file="algolia-api-key"%>,
        container: document.querySelector('#sourceInput')
    });

    const placesAutocomplete2 = places({
        appId: <%@include file="algolia-app-id"%>,
        apiKey: <%@include file="algolia-api-key"%>,
        container: document.querySelector('#destInput')
    });

    const locations = {lat1: 0.0, lon1: 0.0, lat2: 0.0, lon2: 0.0};

    const walking = ["image/walk.jpg", "<b>Walking</b> is the best way to travel a short distance. Not only is it good for the environment, walking also has many health benefits.<br/>Average speed: 3 MPH.", "Take a walk"];
    const scooter = ["image/scooter.jpg", "<b>Scooters</b> are a great way to travel moderate distances. Lighter than a bike, the scooter is a lot of fun.<br/>Average speed: 15 MPH and have a range of 20mph.", "Ride a scooter"];
    const drive = ["image/drive.png", "<b>Driving</b> is the easiest way to travel long distances. With a car, you can go anywhere, that there are roads, the world is your oyster.<br/>Average speed: 65 MPH.", "Drive a car"];
    const fly = ["image/airplane.jpg", "<b>Airplanes</b> are the fastest way to travel long distances. While you can only depart and arrive at airports, an airplane is unparalleled in the speed department. And if one is willing to spend it can be a very comfortable experience<br/>Average speed: 575 MPH.", "Fly on an airplane"];

    function haversineFormula(lat1, lon1, lat2, lon2) {
        const earthRadius = 6371; // km (change this constant to get miles)
        const distanceLatitute = (lat2 - lat1) * Math.PI / 180;
        const distanceLongitude = (lon2 - lon1) * Math.PI / 180;
        const a = Math.sin(distanceLatitute / 2) * Math.sin(distanceLatitute / 2) +
            Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
            Math.sin(distanceLongitude / 2) * Math.sin(distanceLongitude / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return earthRadius * c;
    }

    function showOutput(event) {
        let distance;
        if (event.TESTING !== undefined) {
            console.log("Using test distance")
            distance = event.DISTANCE;
        } else {
            event.preventDefault();
            distance = haversineFormula(locations.lat1, locations.lon1, locations.lat2, locations.lon2);
        }

        const card = document.createElement("div");
        const cardBody = document.createElement("div");
        const img = document.createElement("img");
        const cardHeader = document.createElement("h3");
        const blurb = document.createElement("p");
        const distanceOut = document.createElement("h5");
        const outputDiv = document.getElementById("travelTypeOutput");

        let transport;

        if (distance < 2) {
            transport = walking;
        } else if (distance < 10) {
            transport = scooter;
        } else if (distance < 600) {
            transport = drive;
        } else {
            transport = fly;
        }

        card.classList.add("card");
        card.style.width = "20rem";
        cardBody.classList.add("card-body");
        img.classList.add("card-img-top");
        img.src = transport[0];
        img.style.height = "50%";
        img.style.width = "auto";
        cardHeader.textContent = transport[2];
        blurb.innerHTML = transport[1];
        distanceOut.textContent = "Distance between locations: " + Math.ceil(distance / 1.609) + " miles";

        cardBody.append(cardHeader, blurb, distanceOut);
        card.append(img, cardBody);

        outputDiv.innerHTML = "";
        outputDiv.appendChild(card);
    }

    placesAutocomplete1.on('change', event => {
        if (event.suggestion.latlng !== undefined) {
            locations.lat1 = event.suggestion.latlng.lat;
            locations.lon1 = event.suggestion.latlng.lng;
        }
    });

    placesAutocomplete2.on('change', event => {
        if (event.suggestion.latlng !== undefined) {
            locations.lat2 = event.suggestion.latlng.lat;
            locations.lon2 = event.suggestion.latlng.lng;
        }
    });

    document.getElementById("geocodingInput").addEventListener('submit', showOutput, true);
</script>
</body>
</html>