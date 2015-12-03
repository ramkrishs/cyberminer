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
        <style>
            input[type] {
                /*margin-top: 24px;*/
                transition: 0.5s;
            }
            input[type]:focus + label {
                margin-top: -55px;
                transition: 0.5s;
            }
            input[type]:focus:valid + label {
                color: rgba(0,150,255, 1);
            }
            input[type]:focus:invalid + label, input[type]:invalid {
                color: rgba(255,69,0, 1);
            }
            input[type]:focus:valid + label:after {
                content: "✓";
                margin-left: 0.5em;
            }
            input[type]:valid + label {
                margin-top: -55px;
                color: rgba(200,200,200, 1);
            }

        </style>
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
                            <form action="result" id="addurlForm" method="post">
                                <div>
                                    <input type="text" id="url-input" name="urlString" placeholder="Enter the URL ex: http://utdallas.edu" data-label="URL" class="floatlabel">
                                </div>
                                <div>
                                    <input type="text" id="desc-input" name="userDescription" placeholder="Enter the URL's description" data-label="Description" class="floatlabel">
                                </div>
                                <input type="submit" value="Add URL" name="insert" class="butn">

                            </form>
                            <%
                                
                                if (request.getAttribute("insertResult") != null) {
                                    boolean insertResponse = (boolean)request.getAttribute("insertResult");
                                    if (insertResponse) {
                            %>
                            <div class="alert alert-success text-center fade in" role="alert" style="margin-top:20px;">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
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
        <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
        <script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/floatlabels.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('input.floatlabel').floatlabel();
            });
        </script>
        <script src="js/main.js"></script>
        <script>
            $("#addurlForm").validate({
                submitHandler: function (form) {

                    form.submit();
                },
                rules: {
                    urlString: {
                        required: true,
                        url: true
                    }
                }
            });
        </script>
    </body>
</html>