<%-- 
    Document   : search
    Created on : Nov 8, 2015, 3:08:39 AM
    Author     : Ram
--%>

<%@page import="java.util.Map"%>
<%@page import="org.elasticsearch.search.SearchHit"%>
<%@page import="org.elasticsearch.action.search.SearchResponse"%>
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
                    <form action="result" method="post">
                    <div class="input-group col-md-12 col-sm-12 col-xs-12 search-bar  ">
                        <input type="text" class="form-control input-lg" placeholder="Enter a String to Search in KWIC Index" name="searchString" id="SearchString"/>
                        <span class="input-group-btn">
                            <button class="btn btn-info btn-lg" type="submit" data-toggle="tooltip" name="search" data-placement="top" title="Click here to Search" id="gen_btn">
                                <i class="glyphicon glyphicon-search"></i> Search
                            </button>
                        </span>
                    </div>
                        </form>
                    <div class="search-count">search result: </div>
                    <hr>
                    <h3 class="search-count">Search Result</h3>
                    <div class="search-result">
                        <% 
                            SearchResponse searchResponse = (SearchResponse)request.getAttribute("searchResult");
                            
                            if (searchResponse != null) {
                                SearchHit[] results = searchResponse.getHits().getHits();
                                
                                for(SearchHit hit : results){

                                  String sourceAsString = hit.getSourceAsString();

                                     Map<String, Object> data = hit.getSource();

                                   if (sourceAsString != null) {
                                      %>
                                      <li><a href="<% out.println(data.get("url")); %>" target="_blank"><% out.println(data.get("url")); %></a>
                                        <p><% out.println(data.get("description")); %></p>
                                      </li>
                                      <%  
                                   }
                                 }
                            }%>
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

