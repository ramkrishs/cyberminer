<%-- 
    Document   : index
    Created on : Nov 8, 2015, 3:07:54 AM
    Author     : Ram
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
        <title>Cyberminer - Home</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <!--[if lt IE 9]>
        <script src="js/vendor/html5-3.6-respond-1.4.2.min.js"></script>
        <![endif]-->
        <style type="text/css">
            body{
                overflow: hidden;
                padding-top: 50px;

            }
        </style>
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
                            <p>Search Engine<br> course project for Advanced Software Architecture.</p>
                            <h4><strong>Prof: Dr. Lawrence Chung</strong></h3>
                                <h4>Team members</h4>
                                <li>Karthik Kannambadi Sridhar</li>
                                <li>Ramakrishnan Sathyavageeswaran</li>
                                <li>Vaidehi Jariwala</li>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 mainbar">
                    <nav>
                        <div class="row">
                            <div class="col-md-4">
                                <nav>
                                    <a  href="addurl.jsp" class="butn text-center" >add url</a>
                                    <a  href="search.jsp" class="butn text-center push-bit" >search url</a>
                                    <a  href="delete.jsp" class="butn text-center">delete  url</a>
                                    <a  href="config.jsp" class="butn text-center push-bit">user config</a>
                                </nav>
                            </div>

                        </div>
                    </nav>
                </div>
            </div>


        </div> <!-- /container -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
