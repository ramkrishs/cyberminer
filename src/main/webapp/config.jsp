<%@page import="com.cyberminer.searchengine.UserFilter"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.elasticsearch.action.index.IndexResponse"%>
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
                        <form method="post" action="result">
                            <div class="input-group col-md-12 col-sm-12 col-xs-12 user-config ">

                                <input type="text" class="form-control input-lg" name="userConfigInput" placeholder="Enter a word / symbol to filter out" id="user_filters"/>
                                <span class="input-group-btn">
                                    <button name="addConfigbtn" class="btn btn-info btn-lg" type="submit" data-toggle="tooltip" data-placement="top" title="Click here to Add filter" id="gena_btn">
                                        <i class="glyphicon glyphicon-save"></i> Add
                                    </button>
                                    <button name="viewConfigbtn" class="btn btn-info btn-lg" type="submit" data-toggle="tooltip" data-placement="top" title="Click here to view filter" id="view_btn">
                                        <i class="glyphicon glyphicon-save"></i> View
                                    </button>
                                </span>
                            </div>
                        </form>
                        <%
                            if (request.getAttribute("filterResult") != null) {
                                boolean insertResponse = (boolean) request.getAttribute("filterResult");
                                if (insertResponse) {
                        %>
                        <div class="alert alert-success text-center">
                            <% out.println("Value Inserted!!");
                                } else {
                                    out.println("Value Not Inserted!!");
                                }
                            %>
                        </div>
                        <%
                            }

                        %>
                        <div class="result">
                            <hr>
                            <% if (request.getAttribute("filterValueResult") != null) {%>
                            <h3>Filter List</h3>
                            <%
                                List<UserFilter> searchResponses = (ArrayList) request.getAttribute("filterValueResult");

                                for (UserFilter data : searchResponses) {

                                    if (data != null) {
                            %>
                            <a class="btn btn-default" style="margin-bottom: 15px;"><% out.println(data.getUserFilter()); %></a>
                            <%
                                        }
                                    }
                                }

                            %>
                        </div>
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