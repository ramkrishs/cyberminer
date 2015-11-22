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
    public SearchResponse orSearch(String index, String document) {
        SearchResponse response = esCon.client.prepareSearch(index)
                .setTypes("urlmapping")
                .setQuery(QueryBuilders.matchQuery("description", document))
                .execute()
                .actionGet();
        return response;
    }

    @Override
    public SearchResponse notSearch(String index, String document) {
        QueryBuilder qb = QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery("description", document));
        SearchResponse response = esCon.client.prepareSearch(index)
                .setTypes("urlmapping")
                .setQuery(qb)
                .execute()
                .actionGet();
        return response;
    }

    @Override
    public SearchResponse andSearch(String index, String[] document) {
        BoolQueryBuilder qb = QueryBuilders.boolQuery()
                .must(QueryBuilders.matchQuery("description", document[0]));
        for (int i = 1; i < document.length; i++) {
            qb.must(QueryBuilders.matchQuery("description", document[i]));
        }
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
