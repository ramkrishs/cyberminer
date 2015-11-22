/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyberminer.DBClient;

import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;

/**
 *
 * @author Ram
 */
public interface DBClient {

    void closeConnection();

    IndexResponse insert(String index, XContentBuilder document);

    SearchResponse orSearch(String index, String document);

    SearchResponse notSearch(String index, String document);

    SearchResponse andSearch(String index, String[] document);

}
