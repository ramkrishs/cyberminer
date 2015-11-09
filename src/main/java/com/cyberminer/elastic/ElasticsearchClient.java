package com.cyberminer.elastic;

import javax.json.JsonObject;

import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

public class ElasticsearchClient {
	
	private ElasticsearchConnection esCon;
	
	public ElasticsearchClient() {
		esCon = new ElasticsearchConnection();
	}
	
	
	public IndexResponse insert(String index, XContentBuilder document) {
		IndexResponse response = esCon.client.prepareIndex(index,"urlmapping")
		        .setSource(document)
		        .execute()
		        .actionGet();
                return response;
	}
        
        public SearchResponse search(String index, String document) {
		SearchResponse response = esCon.client.prepareSearch(index)
                                        .setTypes("urlmapping")
                                        .setQuery(QueryBuilders.matchQuery("description", document))
                                        .execute()
                                        .actionGet();
                return response;
	}

	
	public void closeConnection() {
		this.esCon.closeClient();
	}
}
