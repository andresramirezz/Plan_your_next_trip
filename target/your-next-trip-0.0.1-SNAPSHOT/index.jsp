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
    <script src="./js/login.js" type="text/javascript"></script>


    <link href="./css/style.css" rel="stylesheet">

    <style>
        body {
            background-image: url('./image/qline.jpg');
        }

        #loginForm {
            background-color: white;
            padding: 15px;
            border-radius: 10px;
            margin-top: 30px;
            margin-bottom: 30px;
        }
    </style>

    <title>Home | Your Next Trip</title>
</head>
<body>
<%@ include file="header.html" %>
<div class="container-fluid">
    <div class="row mt-5">
        <div class="col-sm-12 col-md-8 col-lg-5 mx-auto">
            <div id="placesCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#placesCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#placesCarousel" data-slide-to="1"></li>
                    <li data-target="#placesCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="image/newyork.png" alt="New York">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>New York</h5>
                            <small>By Daryan Shamkhali - Unsplash</small>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="image/austria.png" alt="Austria">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Hallstatt, Austria</h5>
                            <small>By Sorasak - Unsplash</small>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="image/sydney.png" alt="Sydney">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Pyrmont, Sydney</h5>
                            <small>By Martyna Bober - Unsplash</small>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#placesCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#placesCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-8 col-lg-5 mx-auto">
            <form id="loginForm" onsubmit="validateLogin(event)">
                <div class="form-group">
                    <label for="loginEmail">Email address</label>
                    <input type="email"
                           class="form-control"
                           id="loginEmail"
                           aria-describedby="emailHelp"
                           placeholder="Email">
                </div>

                <div class="form-group">
                    <label for="loginPassword">Password</label>
                    <input type="password"
                           class="form-control"
                           id="loginPassword"
                           placeholder="Password">
                </div>

                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
    </div>
</div>
<%@ include file="footer.html" %>
<script>
	document.getElementById("loginEmail").focus();
</script>
</body>
</html>