package com.cyberminer.elastic;

import com.cyberminer.DBClient.DBClient;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import static org.elasticsearch.index.query.FilterBuilders.boolFilter;
import static org.elasticsearch.index.query.FilterBuilders.termFilter;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

public class ElasticsearchClient implements DBClient {

    private ElasticsearchConnection esCon;

    public ElasticsearchClient() {
        esCon = new ElasticsearchConnection();
    }

    @Override
    public IndexResponse insert(String index, XContentBuilder document) {
        IndexResponse response = esCon.client.prepareIndex(index, "urlmapping")
                .setSource(document)
                .execute()
                .actionGet();
        return response;
    }

    @Override
    public SearchResponse search(String index, String document) {
        SearchResponse response = esCon.client.prepareSearch(index)
                .setTypes("urlmapping")
                .setQuery(QueryBuilders.matchQuery("description", document))
                .execute()
                .actionGet();
        return response;
    }
    
    @Override
    public SearchResponse notSearch(String index,String document){
        //BoolQueryBuilder qb = QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery("description", document));
        QueryBuilder qb = QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery("description", document));
//FilterBuilder qb = boolFilter().mustNot(termFilter("description", document));
        SearchResponse response = esCon.client.prepareSearch(index)
                        .setTypes("urlmapping")
                        .setQuery(qb)
                        .execute()
                        .actionGet();
        
        
                                
        
        return response;
    }

    @Override
    public void closeConnection() {
        this.esCon.closeClient();
    }
}
