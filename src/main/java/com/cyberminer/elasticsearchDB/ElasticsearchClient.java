package com.cyberminer.elasticsearchDB;

import com.cyberminer.DBClient.DBClient;
import com.cyberminer.commons.Constants;
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
    
        
    @Override
    public IndexResponse insert(String type,XContentBuilder document) {
        
        IndexResponse response = esCon.client.prepareIndex(Constants.URL_TABLE_NAME, type)
                .setSource(document)
                .execute()
                .actionGet();
        return response;
    }

    @Override
    public SearchResponse orSearch(String document) {
        
        BoolQueryBuilder filterQuery = this.getFilterquery();
        
        FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(QueryBuilders.matchQuery("description", document),
                FilterBuilders.queryFilter(filterQuery));
        SearchResponse response = esCon.client.prepareSearch(Constants.URL_TABLE_NAME)
                .setTypes(Constants.ES_TYPE)
                .setQuery(fbuilder)
                .execute()
                .actionGet();
        return response;
    }
    @Override
    public List<String> userFilterresponse(){
       List<String> searchResponses = new  ArrayList();
        SearchResponse response = this.getAllrecord(Constants.FILTER_TYPE);
        if (response != null) {
                    
                    SearchHit[] results = response.getHits().getHits();
                    for (SearchHit hit : results) {
                        
                        String data = hit.getSource().get("userfilters").toString();
                        //System.out.println(data);
                        searchResponses.add(data);
                    }
        }
        return searchResponses;
    }
    
    public BoolQueryBuilder getFilterquery(){
         List<String> userFilters = this.userFilterresponse();
        BoolQueryBuilder filterQuery = QueryBuilders.boolQuery();
        
        for (String userFilter : userFilters) {
            filterQuery.mustNot(QueryBuilders.matchQuery("description", userFilter));
        }
        return filterQuery;
    }
    
    @Override
    public SearchResponse notSearch(String document) {
         BoolQueryBuilder filterQuery = this.getFilterquery();
         QueryBuilder qb = QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery("description", document));
         FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(qb, 
                FilterBuilders.queryFilter(filterQuery));
        
        SearchResponse response = esCon.client.prepareSearch(Constants.URL_TABLE_NAME)
                .setTypes(Constants.ES_TYPE)
                .setQuery(fbuilder)
                .execute()
                .actionGet();
        
        
        return response;
    }

    @Override
    public SearchResponse andSearch(String[] documents) {
        BoolQueryBuilder qb = QueryBuilders.boolQuery();
        BoolQueryBuilder filterQuery = this.getFilterquery();        
        for (String document : documents) {
            qb.must(QueryBuilders.matchQuery("description", document));
        }
        FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(qb, 
                FilterBuilders.queryFilter(filterQuery));
        SearchResponse response = esCon.client.prepareSearch(Constants.URL_TABLE_NAME)
                .setTypes(Constants.ES_TYPE)
                .setQuery(fbuilder)
                .execute()
                .actionGet();
        return response;
    }
    @Override
    public SearchResponse getAllrecord(String type) {
        SearchResponse response = esCon.client.prepareSearch(Constants.URL_TABLE_NAME)
                .setTypes(type)
                .setQuery(QueryBuilders.matchAllQuery())
                .execute()
                .actionGet();
        return response;
    }
    
    @Override
    public DeleteResponse delete(String documentID) {
        DeleteResponse response = esCon.client.prepareDelete(Constants.URL_TABLE_NAME,
                                    Constants.ES_TYPE , documentID)
                .get();
        
        return response;
    }
    @Override
    public void closeConnection() {
        this.esCon.closeClient();
    }
}
