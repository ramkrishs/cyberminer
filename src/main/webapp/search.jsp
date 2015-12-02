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
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link href="css/main.css" rel="stylesheet">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <style type="text/css">
        .holder {
            margin: 15px 0;
        }
        .holder a {
            font-size: 12px;
            cursor: pointer;
            margin: 0 5px;
            color: #333;
        }
        .holder a:hover {
            background-color: #222;
            color: #fff;
        }
        .holder a.jp-previous { margin-right: 15px; }
        .holder a.jp-next { margin-left: 15px; }
        .holder a.jp-current, a.jp-current:hover {
            color: #FF4242;
            font-weight: bold;
        }
        .holder a.jp-disabled, a.jp-disabled:hover {
            color: #bbb;
        }
        .holder a.jp-current, a.jp-current:hover,
        .holder a.jp-disabled, a.jp-disabled:hover {
            cursor: default;
            background: none;
        }
        .holder span { margin: 0 5px; }
        
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


                        <% if (request.getAttribute("searchResponse") != null) {%>
                        <%
                            List<Searchengine> searchResponses = (ArrayList) request.getAttribute("searchResponse");
                        %>
                        
                        <div id="azSort" class="pull-right btn-success" data-toggle="tooltip" data-placement="bottom" title="Click here to sort alphabetically " style="margin-right: 10px;"><i id="azSortIcon" class="fa fa-sort-alpha-asc" style="font-size: 22px; padding: 6px; border-bottom: solid 4px #DDDDDD;"></i></div>
                        <div id="numSort" class="pull-right btn-success" data-toggle="tooltip" data-placement="bottom" title="Click here to sort based on Hitrate " style="margin-right: 10px;"><i id="numSortIcon" class="fa fa-sort-numeric-asc " style="font-size: 22px; padding: 6px; border-bottom: solid 4px #DDDDDD;"></i></div>
                        <div class="search-count pull-right" style="margin-right: 10px; padding-top: 8px;">Sort the results based on: </div>
                        <div>search input: <c:out value="${param['searchString']}"></c:out></div> 
                        
                        <div class="search-count">search result: <span class="total-count">
                                <%
                                    if (searchResponses.size() > 0) {
                                        Searchengine totalhit = searchResponses.get(0);

                                        out.println(totalhit.getTotalhits());
                                    } else {
                                        out.println(0);
                                    }

                                %></span>
                        </div>

                        <hr>
                        <form class="pull-right" style="margin-right: 10px;">
                            <select>
                                <option>5</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                            </select>
                        </form>
                        <h3 class="search-count">Search Result</h3>
                        <div class="search-result">
                            <ul id="list">
                                <c:forEach items="${searchResponse}" var="data">
                                    <li>
                                        <a href="<c:out value='${data.getUrl()}'></c:out>" hitid ="<c:out value='${data.getHitrate()}'></c:out>"  docid ="<c:out value='${data.getId()}'></c:out>" target="_blank"><c:out value='${data.getUrl()}'></c:out></a>
                                        <p id="de"><c:out value='${data.getDescription()}'></c:out></p>
                                        <div id="hitrate" style="display: none;" ><c:out value='${data.getHitrate()}'></c:out></div>
                                       
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="holder" style="margin-left:35%;"></div>
                        </div>
                        
                        <%                                }
                        %>
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
       
        <script src="js/vendor/bootstrap.min.js"></script>
        
        <script>
            var totalCount = Number($('.total-count').text().trim());
            console.log(totalCount);
        </script>
        <script>
            
                var desc = false;
    document.getElementById("azSort").onclick = function () {
        
        sortAlphabetically($('#list'), "li", "p", desc);
        desc = !desc;
        return false;
    };
    document.getElementById("numSort").onclick = function () {
        sortHitrate($('#list'), "li", "div", desc);
        desc = !desc;
        return false;
    };
            
            

        </script>
        
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
            $("li a").click(function(){
                
                var value = "2";
                var docID = $(this).attr('docid').trim();
                var hitrate = $(this).attr('hitid').trim();
                console.log(docID);
                $.ajax({
                    url: '/cyberminer/result',
                    data: {
                        "tokenvalues": value,
                        "docID": docID,
                        "hitrate" :hitrate
                    },
                    type: 'post',
                    dataType: "json",
                    success: function (res) {
                        console.log( (res));

                    }
                });
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
       
        <script src="js/jPages.js"></script>
        <script type="text/javascript">
        
        $(function() {
            $("div.holder").jPages({
            containerID : "list",
            perPage : 5
            });
            /* on select change */
            $("select").change(function(){
            /* get new nº of items per page */
            var newPerPage = parseInt( $(this).val() );
            /* destroy jPages and initiate plugin again */
            $("div.holder").jPages("destroy").jPages({
                containerID   : "list",
                    perPage       : newPerPage
            });
            });
        });
        
        </script>
        <script src="js/main.js"></script>
    </body>
</html>

