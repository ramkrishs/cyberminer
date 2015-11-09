<%-- 
    Document   : config
    Created on : Nov 8, 2015, 3:08:15 AM
    Author     : Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Cyberminer - User Config</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
    </head>
    <body>
        <!-- header -->
        <!-- /Header -->
        <!-- Main -->
        <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 sidebar">
                    <div class="masthead clearfix">
                        <h1 class="text-center"><img src="img/logo.png" class="img-responsive"/></h1>
                        <h4 class="text-center">A KWIC Based Search Engine</h4>
                        <div class="text-right">
                            <h3>description</h3>
                            <p>User can filter out <br>symbols/words which are not meaningful.</p>
                            <h4><strong>Prof: Dr. Lawrence Chung</strong></h3>
                            <h4>Team members</h4>
                            <li>Karthik Kannambadi Sridhar</li>
                            <li>Ramakrishnan Sathyavageeswaran</li>
                            <li>Vaidehi Jariwala</li>
                        </div>
                    </div>
                </div>
                <!-- /col-3 -->
                <div class="col-sm-9 mainbar">
                    <a href='index.jsp'>&laquo; Back to Home</a><br>
                    <h1 class="text-center">user config</h1>
                    <div class="input-group col-md-12 col-sm-12 col-xs-12 user-config ">
                        <input type="text" class="form-control input-lg" placeholder="Enter a word / symbol to filter out" id="user_val"/>
                        <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button" data-toggle="tooltip" data-placement="top" title="Click here to Add filter" id="gen_btn">
                        <i class="glyphicon glyphicon-save"></i> Add
                        </button>
                        </span>
                    </div>
                    <hr>
                    <h3>Filter List</h3>
                    <div class="result">
                        <a class="btn btn-default">ram</a>
                        <a class="btn btn-default">$</a>
                        <a class="btn btn-default">Filterword</a>
                        <a class="btn btn-default">Noshow word</a>
                        <a class="btn btn-default">^</a>
                        <a class="btn btn-default">&amp;</a>
                        <a class="btn btn-default">~</a>
                        <a class="btn btn-default">!</a>
                        <a class="btn btn-default">@</a>
                    </div>
                </div>
            </div>
            <!--/col-span-9-->
        </div>
    
    <!-- /Main -->
<footer class="text-center">Cyberminer ASA Project UTDallas Fall 2015</a></footer>
   </div>

<!-- script references -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>