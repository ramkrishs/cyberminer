/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyberminer.elasticsearchDB;

import com.cyberminer.commons.Constants;
import com.cyberminer.elasticsearchDB.ElasticsearchClient;
import com.cyberminer.kwic.Alphabetizer;
import com.cyberminer.kwic.CircularShift;
import com.cyberminer.kwic.NoiseEliminator;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;
import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;
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

        String stringName = request.getParameter("userDescription");
        String urlvalue = request.getParameter("urlString");
        if (request.getParameter("insert") != null) {
            
            if (!stringName.isEmpty() && !urlvalue.isEmpty()) {
                
                CircularShift csObject = new CircularShift();
                Alphabetizer alphabetizerObject = new Alphabetizer();
                NoiseEliminator noiseElimatorObject = new NoiseEliminator();
                csObject.doCircularShift(stringName);
                ArrayList<String> csArrayOutput = csObject.getCsOutput();
                ArrayList<String> noiseElimatedOutput = noiseElimatorObject.elimateNoiseLine(csArrayOutput);
                alphabetizerObject.doAlphabetize(noiseElimatedOutput);
                ArrayList<String> alphalist = alphabetizerObject.getAlphabetizedOutput();
                alphalist.add(stringName);
                XContentBuilder builder;
                builder = jsonBuilder()
                        .startObject()
                        .field("url", urlvalue)
                        .field("description", alphalist)
                        .field("hitrate",0)
                        .endObject();
                IndexResponse insertResponse = new IndexResponse();
                insertResponse = escon.insert(Constants.ES_TYPE,builder);
                if (insertResponse != null) {
                    request.setAttribute("insertResult", insertResponse);
                    RequestDispatcher rd = request.getRequestDispatcher("addurl.jsp");
                    rd.forward(request, response);

                }
            }
        }
        String userConfigInput = request.getParameter("userConfigInput");
        
        if (request.getParameter("addConfigbtn") != null) {
            System.out.println(userConfigInput);
            if (!userConfigInput.isEmpty()) {
                
                XContentBuilder builder;
                builder = jsonBuilder()
                        .startObject()
                        .field("userfilters", userConfigInput)
                        .endObject();
                IndexResponse insertResponse = new IndexResponse();
                insertResponse = escon.insert(Constants.FILTER_TYPE,builder);
                if (insertResponse.isCreated()) {
                    
                    request.setAttribute("filterResult", insertResponse);
                    RequestDispatcher rd = request.getRequestDispatcher("config.jsp");
                    rd.forward(request, response);
                    

                }
            }
        }
        else if(request.getParameter("viewConfigbtn") != null) {
                    SearchResponse searchResponse = new SearchResponse();
                    List<String> newlist = escon.userFilterresponse();
                    for(String i:newlist){
                        System.out.println("value: " + i);
                    }
                    
                    searchResponse = escon.getAllrecord(Constants.FILTER_TYPE);
                    if (searchResponse != null) {
                    List<Map<String, Object>> searchResponses = new  ArrayList();
                    SearchHit[] results = searchResponse.getHits().getHits();
                    
                    for (SearchHit hit : results) {
                        
                        Map<String, Object> data = hit.getSource();
                        searchResponses.add(data);
                    }
                    
                    request.setAttribute("filterValueResult", searchResponses);
                    RequestDispatcher rd = request.getRequestDispatcher("config.jsp");
                    rd.forward(request, response);

                    }
        }
        
        String searchString = request.getParameter("searchString");
        if (request.getParameter("search") != null) {
            if (!searchString.isEmpty()) {
                SearchResponse searchResponse = new SearchResponse();
                if (searchString.contains("!")) {
                    String[] newString = searchString.split(Pattern.quote("!"));
                    searchResponse = escon.notSearch(newString[1]);
                } else if (searchString.contains("&&")) {
                    String[] newString = searchString.split(Pattern.quote("&&"));
                    for (int i = 0; i < newString.length; i++) {
                        newString[i] = newString[i].trim();
                    }
                    searchResponse = escon.andSearch(newString);
                } else {

                    searchResponse = escon.orSearch(searchString);

                }
                
                if (searchResponse != null) {
                    List<Map<String, Object>> searchResponses = new  ArrayList();
                    SearchHit[] results = searchResponse.getHits().getHits();
                    int totalHits = (int) searchResponse.getHits().totalHits();
                    for (SearchHit hit : results) {
                        
                        Map<String, Object> data = hit.getSource();
                        searchResponses.add(data);
                    }
                    request.setAttribute("searchResult", totalHits);
                    request.setAttribute("searchResponse", searchResponses);
                    RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
                    rd.forward(request, response);

                }
                
            }
           
        }
        
        
        if(request.getParameter("deletepage") != null){
            SearchResponse searchResponse = new SearchResponse();
            searchResponse = escon.getAllrecord(Constants.ES_TYPE);
            if (searchResponse != null) {
                    List<Map<String, Object>> searchResponses = new  ArrayList();
                    SearchHit[] results = searchResponse.getHits().getHits();
                    
                    for (SearchHit hit : results) {
                        
                        Map<String, Object> data = hit.getSource();
                        data.put("id", hit.getId());
                        searchResponses.add(data);
                    }
                    
                    request.setAttribute("searchResponse", searchResponses);
                    RequestDispatcher rd = request.getRequestDispatcher("delete.jsp");
                    rd.forward(request, response);

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
        DeleteResponse delResponse = new DeleteResponse();
        String documentID = req.getParameter("docid");
        //searchResponse = escon.notSearch("best");
        if(req.getParameter("docid")!=null){
            delResponse = escon.delete(documentID);
        
            if (delResponse.isFound()) {

            resp.setContentType("text/plain");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(documentID);
            }
        }
        

        
}
}