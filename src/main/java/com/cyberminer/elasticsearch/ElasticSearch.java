/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyberminer.elasticsearch;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;

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

        String stringName = request.getParameter("userInputString");
        String urlvalue = request.getParameter("urlString");
//        XContentBuilder builder = jsonBuilder()
//                                    .startObject()
//                                        .field("url", urlvalue)
//                                        .field("description",stringName)
//                                        .field("hitrate", "3")
//                                    .endObject();
//        
//       IndexResponse indresponse = new IndexResponse();
        
//       indresponse = escon.insert("kwic", builder);
       
       SearchResponse sr = new SearchResponse();
       
       sr = escon.search("kwic", "is");
       
       SearchHit[] results = sr.getHits().getHits();
       
       for(SearchHit hit : results){

            String sourceAsString = hit.getSourceAsString();
            if (sourceAsString != null) {
                
                System.out.println((sourceAsString));
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
