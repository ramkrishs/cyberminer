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
                            SearchResponse searchResponse = (SearchResponse)request.getAttribute("searchResult");
                            
                            %>
                    <div class="search-count">search result: <% if (searchResponse != null) { 
                        out.println(searchResponse.getHits().totalHits()); %>
                    </div>
                    <hr>
                    <h3 class="search-count">Search Result</h3>
                    <div class="search-result">
                        <%
                            
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

