package com.cyberminer.elastic;

import com.cyberminer.DBClient.DBClient;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilders;

public class ElasticsearchClient implements DBClient {
	
	private ElasticsearchConnection esCon;
	
	public ElasticsearchClient() {
		esCon = new ElasticsearchConnection();
	}
	
	
    @Override
	public IndexResponse insert(String index, XContentBuilder document) {
		IndexResponse response = esCon.client.prepareIndex(index,"urlmapping")
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
	public void closeConnection() {
		this.esCon.closeClient();
	}
}
