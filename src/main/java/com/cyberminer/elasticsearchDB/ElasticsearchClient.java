package com.cyberminer.elasticsearchDB;

import com.cyberminer.DBClient.DBClient;
import com.cyberminer.commons.Constants;
import com.cyberminer.searchengine.Searchengine;
import com.cyberminer.searchengine.UserFilter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.BoolFilterBuilder;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.FilterBuilders;
import org.elasticsearch.index.query.FilteredQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;

public class ElasticsearchClient implements DBClient {

    private ElasticsearchConnection esCon;

    public ElasticsearchClient() {
        esCon = new ElasticsearchConnection();
    }
    
    private SearchResponse runESQuery(String type,QueryBuilder qb){
        SearchResponse response = esCon.client.prepareSearch(Constants.URL_TABLE_NAME)
                .setTypes(type)
                .setQuery(qb)
                .execute()
                .actionGet();
        return response;
    }
    
    private List<Searchengine> getSearchengineDBEntires(SearchResponse response){
        
        List<Searchengine> searchResponses = new  ArrayList();
        if (response != null) {

            SearchHit[] results = response.getHits().getHits();
            int totalHits = (int) response.getHits().totalHits();
            for (SearchHit hit : results) {
                Searchengine searchengineObj = new Searchengine();
                String id = hit.getId();
                String url = hit.getSource().get("url").toString();
                ArrayList descrip;
                descrip = (ArrayList) hit.getSource().get("description");
                String description = (String) descrip.get(descrip.size()-1);
                int hitRate = (int) hit.getSource().get("hitrate");
                searchengineObj.setId(id);
                searchengineObj.setUrl(url);
                searchengineObj.setDescription(description);
                searchengineObj.setHitrate(hitRate);
                searchengineObj.setTotalhits(totalHits);
                searchResponses.add(searchengineObj);
            }
            
        }
        
        return searchResponses;
    } 
    
    @Override
    public boolean insert(String type,XContentBuilder document) {
        
        IndexResponse response = esCon.client.prepareIndex(Constants.URL_TABLE_NAME, type)
                .setSource(document)
                .execute()
                .actionGet();
        return response.isCreated();
    }

    
    @Override
    public List<UserFilter> userFilterresponse(){
       List<UserFilter> searchResponses = new  ArrayList();
       
        SearchResponse response = this.runESQuery(Constants.FILTER_TYPE, QueryBuilders.matchAllQuery());
        if (response != null) {
                    
                    SearchHit[] results = response.getHits().getHits();
                    for (SearchHit hit : results) {
                        UserFilter userFilterObj = new UserFilter();
                        String filterResponse = hit.getSource().get("userfilters").toString();
                        String filterID = hit.getId();
                        userFilterObj.setUserFilter(filterResponse);
                        userFilterObj.setFilterID(filterID);
                        //System.out.println(data);
                        searchResponses.add(userFilterObj);
                    }
        }
        return searchResponses;
    }
    
    public BoolQueryBuilder getFilterquery(){
         List<UserFilter> userFilters = this.userFilterresponse();
        BoolQueryBuilder filterQuery = QueryBuilders.boolQuery();
        
        for (UserFilter userFilter : userFilters) {
            filterQuery.mustNot(QueryBuilders.matchQuery("description", userFilter.getUserFilter()));
        }
        return filterQuery;
    }
    
    @Override
    public List<Searchengine> orSearch(String document) {
        
        BoolQueryBuilder filterQuery = this.getFilterquery();
        List<Searchengine> searchResponses = new  ArrayList();
        
        FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(QueryBuilders.matchQuery("description", document),
                FilterBuilders.queryFilter(filterQuery));
        SearchResponse response = this.runESQuery(Constants.ES_TYPE, fbuilder);
        
        if (response != null) {
                    
            searchResponses = this.getSearchengineDBEntires(response);
                    
        }
        
        
        return searchResponses;
    }
    
    @Override
    public List<Searchengine> notSearch(String document) {
         BoolQueryBuilder filterQuery = this.getFilterquery();
         List<Searchengine> searchResponses = new  ArrayList();
         QueryBuilder qb = QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery("description", document));
         FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(qb, 
                FilterBuilders.queryFilter(filterQuery));
        SearchResponse response = this.runESQuery(Constants.ES_TYPE, fbuilder);
        
        if (response != null) {
                    
            searchResponses = this.getSearchengineDBEntires(response);
                    
        }
        
        
        return searchResponses;
    }

    @Override
    public List<Searchengine> andSearch(String[] documents) {
        BoolQueryBuilder qb = QueryBuilders.boolQuery();
        List<Searchengine> searchResponses = new  ArrayList();
        BoolQueryBuilder filterQuery = this.getFilterquery();        
        for (String document : documents) {
            qb.must(QueryBuilders.matchQuery("description", document));
        }
        FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(qb, 
                FilterBuilders.queryFilter(filterQuery));
        
        SearchResponse response = this.runESQuery(Constants.ES_TYPE, fbuilder);
       
        if (response != null) {
                    
            searchResponses = this.getSearchengineDBEntires(response);
                    
        }
        
        
        return searchResponses;
    }
    @Override
    public List<Searchengine> getAllrecord(String type) {
        
        List<Searchengine> searchResponses = new  ArrayList();
        
        SearchResponse response = this.runESQuery(type, QueryBuilders.matchAllQuery());
        if (response != null) {
                    
            searchResponses = this.getSearchengineDBEntires(response);
                    
        }
        
        return searchResponses;
    }
    
    @Override
    public boolean delete(String documentID) {
        DeleteResponse response = esCon.client.prepareDelete(Constants.URL_TABLE_NAME,
                                    Constants.ES_TYPE , documentID).get();
        
        return response.isFound();
    }
    @Override
    public void closeConnection() {
        this.esCon.closeClient();
    }
}
