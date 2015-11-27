<%-- 
    Document   : search
    Created on : Nov 8, 2015, 3:08:39 AM
    Author     : Ram
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="org.elasticsearch.search.SearchHit"%>
<%@page import="org.elasticsearch.action.search.SearchResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Cyberminer - Home</title>
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
                                <p>By entering the<br> description you can search for url</p>
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
                        <%
                            List<Map<String, Object>> searchResponses = (ArrayList) request.getAttribute("searchResponse");;
                        %>
                        
                         <% if (request.getAttribute("searchResponse")!= null) {%>
                         
                         <div id="azSort" class="pull-right btn-success" data-toggle="tooltip" data-placement="bottom" title="Click here to sort alphabetically " style="margin-right: 10px;"><i id="azSortIcon" class="glyphicon glyphicon-sort-by-alphabet " style="font-size: 22px; padding: 6px; border-bottom: solid 4px #DDDDDD;"></i></div>
                         <div id="numSort" class="pull-right btn-success" data-toggle="tooltip" data-placement="bottom" title="Click here to sort based on Hitrate " style="margin-right: 10px;"><i id="numSortIcon" class="glyphicon glyphicon-sort-by-order " style="font-size: 22px; padding: 6px; border-bottom: solid 4px #DDDDDD;"></i></div>
                         <div class="search-count pull-right" style="margin-right: 10px; padding-top: 8px;">Sort the results based on: </div>
                        <div class="search-count">search result: 
                           <%
                                int totalHits = (int) request.getAttribute("searchResult");
                                out.println(totalHits); 
                            %>
                        </div>
                       
                        <hr>
                        <h3 class="search-count">Search Result</h3>
                        <div class="search-result">
                            <ul id="list">
                            <%

                                for (Map data : searchResponses) {

                                    if (data != null) {
                            %>
                            
                            <li><a href="<% out.println(data.get("url")); %>" target="_blank"><% out.println(data.get("url")); %></a>
                                <p id="de"><%
                                    ArrayList descrip = (ArrayList) data.get("description");
                                    System.out.println(descrip.get(0));
                                    out.println(descrip.get(descrip.size()-1)); %></p>
                                <div id="hitrate" style="display: none;"><% out.println(data.get("hitrate")); %></div>
                            </li>
                            
                            <%
                                        }
                                    }
                            }
                            
                            %>
                        </ul>
                        </div>
                    </div>
                    <!--/col-span-9-->
                </div>
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

