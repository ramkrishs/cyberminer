package com.cyberminer.elasticsearchDB;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import com.cyberminer.commons.Constants;

public class ElasticsearchConnection {

    public Client client;
    public static final String ES_CLUSTER_NAME = Constants.ES_CLUSTER_NAME;
    public static final String ES_HOST = Constants.ES_HOST;
    public static final String ES_INDEX = Constants.URL_TABLE_NAME;
    public static final String ES_TYPE = Constants.ES_TYPE;
    public static Settings settings = ImmutableSettings.settingsBuilder()
            .put("cluster.name", ES_CLUSTER_NAME).build();

    public ElasticsearchConnection() {
        try {
            client = new TransportClient(settings)
                    .addTransportAddress(new InetSocketTransportAddress(ES_HOST, 9300));
        } catch (Exception e) {
            System.err.println("Exception in ElasticsearchConnection " + e.getMessage());
        }

    }

    public void closeClient() {
        this.client.close();
    }

}
