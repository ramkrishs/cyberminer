/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyberminer.elastic;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;
import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;

/**
 *
 * @author Karthik Kannambadi Sridhar
 * @author Ramakrishnan Sathyavageeswaran
 * @author Vaidehi Jariwala Fall 2015 - CS 6362.001
 */
public class ElasticSearch extends HttpServlet {

    ElasticsearchClient escon = new ElasticsearchClient();

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String stringName = request.getParameter("userDescription");
        String urlvalue = request.getParameter("urlString");
        if (request.getParameter("insert") != null) {
            if (!stringName.isEmpty() && !urlvalue.isEmpty()) {
                XContentBuilder builder = jsonBuilder()
                        .startObject()
                        .field("url", urlvalue)
                        .field("description", stringName)
                        .field("hitrate", "3")
                        .endObject();
                IndexResponse insertResponse = new IndexResponse();
                insertResponse = escon.insert("kwic", builder);
                if (insertResponse != null) {
                    request.setAttribute("insertResult", insertResponse);
                    RequestDispatcher rd = request.getRequestDispatcher("addurl.jsp");
                    rd.forward(request, response);

                }
            }
        }

        String searchString = request.getParameter("searchString");
        if (request.getParameter("search") != null) {
            if (!searchString.isEmpty()) {
                SearchResponse searchResponse = new SearchResponse();
                searchResponse = escon.search("kwic", searchString);
                if (searchResponse != null) {
                    request.setAttribute("searchResult", searchResponse);
                    RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
                    rd.forward(request, response);

                }
            }
        }

    }

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }

}
