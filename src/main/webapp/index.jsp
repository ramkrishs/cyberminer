<%-- 
    Document   : index
    Created on : Nov 8, 2015, 3:07:54 AM
    Author     : Ram
--%>

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
                                <p>Search Engine<br> course project for Advanced Software Architecture.</p>
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
                        <nav class="main-nav">
                            <a  href="addurl.jsp" class="butn text-center" >add url</a>
                            <a  href="search.jsp" class="butn text-center push-bit" >search url</a>
                            <form action="result" method="post">
                                 <input type="submit" value="delete  url" name="deletepage" class="butn text-center">
                            </form>
                            <a  href="config.jsp" class="butn text-center push-bit">user config</a>
                        </nav>
                    </div>
                    <!--/col-span-9-->
                </div>
            </div>
            <!-- /Main -->
            <footer class="text-center">Cyberminer ASA Project UTDallas Fall 2015</a></footer>
            <!-- script references -->
        </div>
        
        <script src="js/vendor/jquery-1.11.2.js" ></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
       
        <% 
            if(session.isNew()){
                session.setAttribute("siteSession", "cyberminer");
         %>
          <script>
         window.onload = function () {
  $.get('result', function(data) {
        
        console.log(data);
    });
   
};

<%
            }
            else{
              %>   
                 console.log("data");
                              <%
            }
        
        %>
</script>
    </body>
</html>