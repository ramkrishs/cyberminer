package com.cyberminer.DBClient;

import com.cyberminer.searchengine.Searchengine;
import com.cyberminer.searchengine.UserFilter;
import java.util.List;
import org.elasticsearch.common.xcontent.XContentBuilder;

public interface DBClient {

    void closeConnection();

    boolean insert(String type, XContentBuilder document);

    List<Searchengine> orSearch(String document);

    List<Searchengine> notSearch(String document);

    List<Searchengine> andSearch(String[] document);

    List<Searchengine> getAllrecord(String type);

    boolean delete(String documentID);
    
    boolean updateHitrate(String documentID,int hitrate);

    List<UserFilter> userFilterresponse();
}
