<%-- 
    Document   : search
    Created on : Nov 8, 2015, 3:08:39 AM
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Cyberminer - search</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
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

            <div class="row">
                <div class="col-md-3 sidebar">
                    <div class="masthead clearfix">

                        <h1 class="text-center"><img src="img/logo.png" class="img-responsive"/></h1>
                        <h4 class="text-center">A KWIC Based Search Engine</h4>
                        <div class="text-right">
                            <h3>description</h3>
                            <p>By entering the<br> description you can search for url</p>
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
                <div class="col-md-9 mainbar">
                    <a href='index.jsp'>&laquo; Back to Home</a><br>
                    <h1 class="text-center">Search</h1>
                    <div class="input-group col-md-12 col-sm-12 col-xs-12 search-bar  ">
                        <input type="text" class="form-control input-lg" placeholder="Enter a String to Search in KWIC Index" id="user_input_val"/>
                        <span class="input-group-btn">
                            <button class="btn btn-info btn-lg" type="button" data-toggle="tooltip" data-placement="top" title="Click here to Search" id="gen_btn">
                                <i class="glyphicon glyphicon-search"></i> Search
                            </button>
                        </span>
                    </div>
                    <div class="search-count">search result: 30</div>
                    <hr>
                    <h3 class="search-count">Search Result</h3>
                    <div class="search-result">
                        <li><a href="http://google.com" target="_blank">Google.com</a>
                            <p>This is a sample description</p>
                        </li>
                        <li><a href="http://google.com" target="_blank">Google.com</a>
                            <p>This is a sample description</p>
                        </li>
                        <li><a href="http://google.com" target="_blank">Google.com</a>
                            <p>This is a sample description</p>
                        </li>


                    </div>
                </div>
            </div>

        </div> <!-- /container -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>
</html>

