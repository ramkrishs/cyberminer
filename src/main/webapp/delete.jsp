<%-- 
    Document   : delete
    Created on : Nov 8, 2015, 3:08:24 AM
    Author     : Ram
--%>

<%@page import="com.cyberminer.searchengine.Searchengine"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Cyberminer - Delete</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sweetalert.css" rel="stylesheet">
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
                                <p>By clicking the<br> delete button you can delete the out-of-date url.</p>
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
                        <h1 class="text-center">Delete</h1>
                        <hr>

                        <table class="table">

                            <thead>
                                <tr>
                                    <th>URL</th>
                                    <th>Description</th> 
                                    <th>Operation</th>
                                </tr>
                            </thead>
                            <tbody>

                                <% if (request.getAttribute("searchResponse") != null) {%>
                                <%
                                    List<Searchengine> searchResponses = (ArrayList) request.getAttribute("searchResponse");
                                %>
                                <%
                                    for (Searchengine data : searchResponses) {

                                        if (data != null) {
                                %>
                                <tr>
                                    <td><% out.println(data.getUrl()); %></td>
                                    <td><%
                                        out.println(data.getDescription()); %></td>
                                    <td><button docid ="<% out.println(data.getId()); %>" class="btn btn-warning">Delete</button></td> 
                                </tr>
                                <%
                                            }
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
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
        <script src="js/vendor/sweetalert.min.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            $('td button').click(function () {

                var value = $(this).attr('docid').trim();

                swal({title: "Are you sure?",
                    text: "You will not be able to search if you delete this url!!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, delete it!",
                    closeOnConfirm: true},
                function () {
                    calldelete(value);
                });
            });
            function calldelete(value) {
                $.ajax({
                    type: "GET",
                    url: "result",
                    data: {
                        "docid": value
                    },
                    success: function (response) {

                        console.log("resp: " + response);
                        alert("Deleted");
                        window.location.reload();
                    }
                });
            }
        </script>

    </body>
</html>