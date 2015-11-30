<%-- 
    Document   : search
    Created on : Nov 8, 2015, 3:08:39 AM
    Author     : Ram
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.cyberminer.searchengine.Searchengine"%>
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
        <title>Cyberminer - Search</title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link href="css/smartpaginator.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
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
                        <c:if test="${not empty searchResponse}" >
                            <div id="azSort" class="pull-right btn-success" data-toggle="tooltip" data-placement="bottom" title="Click here to sort alphabetically " style="margin-right: 10px;"><i id="azSortIcon" class="fa fa-sort-alpha-asc" style="font-size: 22px; padding: 6px; border-bottom: solid 4px #DDDDDD;"></i></div>
                            <div id="numSort" class="pull-right btn-success" data-toggle="tooltip" data-placement="bottom" title="Click here to sort based on Hitrate " style="margin-right: 10px;"><i id="numSortIcon" class="fa fa-sort-numeric-asc " style="font-size: 22px; padding: 6px; border-bottom: solid 4px #DDDDDD;"></i></div>
                            <div class="search-count pull-right" style="margin-right: 10px; padding-top: 8px;">Sort the results based on: </div>
                            <div class="search-count">search result: <span class="total-count">
                                    <c:if test="${!empty(searchResponse) }">
                                        <c:set var="totalHit" value="${searchResponse.get(0)}"></c:set>
                                        <c:out value="${totalHit.getTotalhits()}"></c:out>
                                    </c:if> 
                                </span>
                            </div>
                            <hr>
                            <h3 class="search-count">Search Result</h3>
                            <div class="search-result">
                                <ul id="list">
                                    <c:forEach items="${searchResponse}" var="data">
                                        <li>
                                            <a href="<c:out value='${data.getUrl()}'></c:out>" target="_blank"><c:out value='${data.getUrl()}'></c:out></a>
                                            <p id="de"><c:out value='${data.getDescription()}'></c:out></p>
                                            <div id="hitrate" style="display: none;"><c:out value='${data.getHitrate()}'></c:out></div>
                                            </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div id="black"  style="margin-left: 40%;">
                            </div>
                        </c:if>
                    </div>
                    <!--/col-span-9-->
                </div>
            </div>
            <!-- /Main -->
            <footer class="text-center">Cyberminer ASA Project UTDallas Fall 2015</a></footer>
        </div>
        <!-- script references -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="js/smartpaginator.js" type="text/javascript"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script>
            var totalCount = Number($('.total-count').text().trim());
            console.log(totalCount);
            $('#black').smartpaginator({totalrecords: totalCount, recordsperpage: 5, datacontainer: 'list', dataelement: 'li', initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'black'});
        </script>
        <script>

        </script>
        <script src="js/main.js"></script>
        <script>
            var value = "1";
            $.ajax({
                url: '/cyberminer/result',
                data: {
                    "tokenvalues": value
                },
                type: 'post',
                dataType: "json",
                success: function (res) {
                    console.log(typeof (res));
                    autofil(res);
                }
            });
            function autofil(val) {
                var availableTags = val;
                function split(val) {
                    return val.split(/ \s*/);
                }
                function extractLast(term) {
                    return split(term).pop();
                }
                $("#SearchString")
                        // don't navigate away from the field on tab when selecting an item
                        .bind("keydown", function (event) {
                            if (event.keyCode === $.ui.keyCode.TAB &&
                                    $(this).autocomplete("instance").menu.active) {
                                event.preventDefault();
                            }
                        })
                        .autocomplete({
                            minLength: 0,
                            source: function (request, response) {
                                // delegate back to autocomplete, but extract the last term
                                response($.ui.autocomplete.filter(
                                        availableTags, extractLast(request.term)));
                            },
                            focus: function () {
                                // prevent value inserted on focus
                                return false;
                            },
                            select: function (event, ui) {
                                var terms = split(this.value);
                                // remove the current input
                                terms.pop();
                                // add the selected item
                                terms.push(ui.item.value);
                                // add placeholder to get the comma-and-space at the end
                                terms.push("");
                                this.value = terms.join(" ");
                                return false;
                            }
                        });
            }
            ;
        </script>
    </body>
</html>

