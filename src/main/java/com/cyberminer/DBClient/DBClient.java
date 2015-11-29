/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyberminer.DBClient;

import java.util.List;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;

/**
 *
 * @author Ram
 */
public interface DBClient {

    void closeConnection();

    IndexResponse insert(String type,XContentBuilder document);

    SearchResponse orSearch(String document);

    SearchResponse notSearch(String document);

    SearchResponse andSearch(String[] document);
    
    SearchResponse getAllrecord(String type);
    
    DeleteResponse delete(String documentID);
    
    public List<String> userFilterresponse();
}
