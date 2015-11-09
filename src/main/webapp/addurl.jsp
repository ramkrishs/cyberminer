<%-- 
    Document   : addurl
    Created on : Nov 8, 2015, 3:08:05 AM
    Author     : Ram
--%>

<%@page import="org.elasticsearch.action.index.IndexResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Cyberminer - Add URL</title>
        <meta name="generator" content="Bootply" />
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
                        <h1 class="text-center">ADD URL</h1>
                        <hr>
                        <div class='add-url-box'>
                            <form action="result" method="post">
                                <div>
                                    <input type="text" id="url-input" name="urlString" placeholder="Enter the URL ex: http://utdallas.edu" data-label="URL" class="floatlabel">
                                </div>
                                <div>
                                    <input type="text" id="desc-input" name="userDescription" placeholder="Enter the URL's description" data-label="Description" class="floatlabel">
                                </div>
                                <input type="submit" value="Add URL" name="insert" class="butn">

                            </form>
                            <%
                                IndexResponse insertResponse = (IndexResponse) request.getAttribute("insertResult");
                                if (insertResponse != null) {
                                    if (insertResponse.isCreated()) {
                            %>
                            <div class="alert alert-success text-center">
                                <% out.println("Value Inserted!!");
                                        } else {
                                            out.println("Value Not Inserted!!");
                                        }

                                    }

                                %>
                            </div>
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
        <script src="js/floatlabels.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('input.floatlabel').floatlabel();
            });
        </script>
        <script src="js/main.js"></script>
    </body>
</html>