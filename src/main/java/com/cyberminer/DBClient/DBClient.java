/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyberminer.DBClient;

import com.cyberminer.searchengine.Searchengine;
import com.cyberminer.searchengine.UserFilter;
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

    boolean insert(String type,XContentBuilder document);

    List<Searchengine> orSearch(String document);

    List<Searchengine> notSearch(String document);

    List<Searchengine> andSearch(String[] document);
    
    List<Searchengine> getAllrecord(String type);
    
    boolean delete(String documentID);
    
    List<UserFilter>userFilterresponse();
}
