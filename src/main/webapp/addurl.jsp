<%-- 
    Document   : addurl
    Created on : Nov 8, 2015, 3:08:05 AM
    Author     : Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Cyberminer - Add URL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                overflow: hidden;
                padding-top: 50px;

            }
        </style>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link href='http://fonts.googleapis.com/css?family=Sanchez|Bangers' rel='stylesheet' type='text/css'>
        <!--[if lt IE 9]>
        <script src="js/vendor/html5-3.6-respond-1.4.2.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!--[if lt IE 8]>
                                    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <div class="container">
            <!-- Example row of columns -->
            <div class="row">
                <div class="col-md-3 sidebar">
                    <div class="masthead clearfix">
                        <h1 class="text-center"><img src="img/logo.png" class="img-responsive"/></h1>
                        <h4 class="text-center">A KWIC Based Search Engine</h4>
                        <div class="text-right">
                            <h3>description</h3>
                            <p>User can filter out <br>symbols/words which are not meaningful.</p>
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
                <div class="col-md-9 mainbar">
                    <a href='index.jsp'>&laquo; Back to Home</a><br>
                    <h1 class="text-center">ADD URL</h1>
                    <hr>
                    <div class='add-url-box'>
                        <form action="#">
                            <div>
                                <input type="text" id="url-input" placeholder="Enter the URL ex: http://utdallas.edu" data-label="URL" class="floatlabel">
                            </div>
                            <div>
                                <input type="text" id="desc-input" placeholder="Enter the URL's description" data-label="Description" class="floatlabel">
                            </div>
                            <input type="submit" value="Add URL" class="butn">

                        </form>
                    </div>
                </div>
            </div>

        </div>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/floatlabels.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('input.floatlabel').floatlabel();
            });
        </script>
        <script src="js/main.js"></script>
    </body>
</html>
