package com.cyberminer.elastic;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

public class ElasticsearchConnection {
	
	public Client client;
	public static final String ES_CLUSTER_NAME = "cyberminer_cluster-dev"; 
	public static final String ES_HOST = "localhost"; 
	public static final String ES_INDEX = "kwic"; 
	public static Settings settings = ImmutableSettings.settingsBuilder()
	        .put("cluster.name", ES_CLUSTER_NAME).build();
	
	
	public ElasticsearchConnection() {
		client =new TransportClient(settings)
				.addTransportAddress(new InetSocketTransportAddress(ES_HOST,9300));
	}

	public void closeClient() {
		this.client.close();
	}

}
