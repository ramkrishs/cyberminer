package com.cyberminer.elastic;

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
    public static final String ES_INDEX = Constants.USER_TABLE_NAME;
    public static Settings settings = ImmutableSettings.settingsBuilder()
            .put("cluster.name", ES_CLUSTER_NAME).build();

    public ElasticsearchConnection() {
        client = new TransportClient(settings)
                .addTransportAddress(new InetSocketTransportAddress(ES_HOST, 9300));
    }

    public void closeClient() {
        this.client.close();
    }

}
