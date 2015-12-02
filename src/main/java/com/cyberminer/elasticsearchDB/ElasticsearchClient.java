package com.cyberminer.elasticsearchDB;

import com.cyberminer.DBClient.DBClient;
import com.cyberminer.commons.Constants;
import com.cyberminer.searchengine.Searchengine;
import com.cyberminer.searchengine.UserFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.FilterBuilders;
import org.elasticsearch.index.query.FilteredQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;

public class ElasticsearchClient implements DBClient {

    private ElasticsearchConnection esCon;

    public ElasticsearchClient() {
        esCon = new ElasticsearchConnection();
    }

    private SearchResponse runESQuery(String type, QueryBuilder qb) {
        SearchResponse response = new SearchResponse();
        try {
            response = esCon.client.prepareSearch(Constants.URL_TABLE_NAME)
                    .setTypes(type)
                    .setQuery(qb)
                    .setFrom(0).setSize(100)
                    .execute()
                    .actionGet();

        } catch (Exception e) {
            System.err.println("Exception in RunESQuery" + e.getMessage());
        }
        return response;
    }

    private List<Searchengine> getSearchengineDBEntires(SearchResponse response) {
        List<Searchengine> searchResponses = new ArrayList();
        try {
            if (response != null) {

                SearchHit[] results = response.getHits().getHits();
                int totalHits = (int) response.getHits().totalHits();
                for (SearchHit hit : results) {
                    Searchengine searchengineObj = new Searchengine();
                    String id = hit.getId();
                    String url = hit.getSource().get("url").toString();
                    ArrayList descrip;
                    descrip = (ArrayList) hit.getSource().get("description");
                    String description = (String) descrip.get(descrip.size() - 1);
                    int hitRate = (int) hit.getSource().get("hitrate");
                    searchengineObj.setId(id);
                    searchengineObj.setUrl(url);
                    searchengineObj.setDescription(description);
                    searchengineObj.setHitrate(hitRate);
                    searchengineObj.setTotalhits(totalHits);
                    searchResponses.add(searchengineObj);
                    System.out.println(url);
                }

            }
        } catch (Exception e) {
            System.err.println("Exception in getSearchengineDBEntires " + e.getMessage());
        }

        return searchResponses;
    }

    @Override
    public boolean insert(String type, XContentBuilder document) {
        IndexResponse response = new IndexResponse();
        try {
            response = esCon.client.prepareIndex(Constants.URL_TABLE_NAME, type)
                    .setSource(document)
                    .execute()
                    .actionGet();
        } catch (Exception e) {
            System.err.println("Exception in insert " + e.getMessage());
        }

        return response.isCreated();
    }

    @Override
    public List<UserFilter> userFilterresponse() {
        List<UserFilter> searchResponses = new ArrayList();
        try {
            SearchResponse response = this.runESQuery(Constants.FILTER_TYPE, QueryBuilders.matchAllQuery());
            if (response != null) {

                SearchHit[] results = response.getHits().getHits();
                for (SearchHit hit : results) {
                    UserFilter userFilterObj = new UserFilter();
                    String filterResponse = hit.getSource().get("userfilters").toString();
                    String filterID = hit.getId();
                    userFilterObj.setUserFilter(filterResponse);
                    userFilterObj.setFilterID(filterID);
                    //System.out.println(data);
                    searchResponses.add(userFilterObj);
                }
            }
        } catch (Exception e) {
            System.err.println("Exception in userFilterresponse " + e.getMessage());
        }

        return searchResponses;
    }

    public BoolQueryBuilder getFilterquery() {
        BoolQueryBuilder filterQuery = QueryBuilders.boolQuery();
        try {
            List<UserFilter> userFilters = this.userFilterresponse();
            for (UserFilter userFilter : userFilters) {
                filterQuery.mustNot(QueryBuilders.matchQuery("description", userFilter.getUserFilter()));
            }
        } catch (Exception e) {
            System.err.println("Exception in getFilterquery " + e.getMessage());
        }

        return filterQuery;
    }

    @Override
    public List<Searchengine> orSearch(String document) {
        List<Searchengine> searchResponses = new ArrayList();
        try {
            BoolQueryBuilder filterQuery = this.getFilterquery();
            FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(QueryBuilders.matchQuery("description", document),
                    FilterBuilders.queryFilter(filterQuery));
            SearchResponse response = this.runESQuery(Constants.ES_TYPE, fbuilder);

            if (response != null) {

                searchResponses = this.getSearchengineDBEntires(response);
            }
        } catch (Exception e) {
            System.err.println("Exception in orSearch " + e.getMessage());
        }
        return searchResponses;
    }

    @Override
    public List<Searchengine> notSearch(String document) {
        List<Searchengine> searchResponses = new ArrayList();
        try {
            BoolQueryBuilder filterQuery = this.getFilterquery();
            QueryBuilder qb = QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery("description", document));
            FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(qb,
                    FilterBuilders.queryFilter(filterQuery));
            SearchResponse response = this.runESQuery(Constants.ES_TYPE, fbuilder);

            if (response != null) {

                searchResponses = this.getSearchengineDBEntires(response);

            }
        } catch (Exception e) {
            System.err.println("Exception in notSearch " + e.getMessage());
        }

        return searchResponses;
    }

    @Override
    public List<Searchengine> andSearch(String[] documents) {
        List<Searchengine> searchResponses = new ArrayList();
        try {
            BoolQueryBuilder qb = QueryBuilders.boolQuery();
            BoolQueryBuilder filterQuery = this.getFilterquery();
            for (String document : documents) {
                qb.must(QueryBuilders.matchQuery("description", document));
            }
            FilteredQueryBuilder fbuilder = QueryBuilders.filteredQuery(qb,
                    FilterBuilders.queryFilter(filterQuery));

            SearchResponse response = this.runESQuery(Constants.ES_TYPE, fbuilder);

            if (response != null) {

                searchResponses = this.getSearchengineDBEntires(response);

            }
        } catch (Exception e) {
            System.err.println("Exception in andSearch " + e.getMessage());
        }
        return searchResponses;
    }

    @Override
    public List<Searchengine> getAllrecord(String type) {
        List<Searchengine> searchResponses = new ArrayList();
        try {
            SearchResponse response = this.runESQuery(type, QueryBuilders.matchAllQuery());
            if (response != null) {

                searchResponses = this.getSearchengineDBEntires(response);

            }
        } catch (Exception e) {
            System.err.println("Exception in getAllrecord " + e.getMessage());
        }

        return searchResponses;
    }

    public List<String> getKeywords() {
        List<String> uniqueTokens = new ArrayList<>();
        List<String> keywordString = new ArrayList<>();
        List<String> keywords = new ArrayList<>();
        List<Searchengine> searchResponses = new ArrayList();
        try {
            SearchResponse response = this.runESQuery(Constants.ES_TYPE, QueryBuilders.matchAllQuery());
            if (response != null) {

                searchResponses = this.getSearchengineDBEntires(response);

                for (Searchengine data : searchResponses) {

                    keywordString.add(data.getDescription());

                }
                for (String key : keywordString) {
                    List<String> stringList = new ArrayList<>(Arrays.asList(key.split(Pattern.quote(" "))));
                    keywords.addAll(stringList);
                }

            }
            Set<String> uniqueWords = new HashSet<>(keywords);
            uniqueTokens = new ArrayList<>(uniqueWords);
        } catch (Exception e) {
            System.err.println("Exception in getKeywords " + e.getMessage());
        }

        return uniqueTokens;

    }
    
    @Override
    public boolean updateHitrate(String documentID,int hitrate){
        UpdateResponse  response =  new UpdateResponse();
        boolean responseFlag = false;
        try{
           
            UpdateRequest updateRequest = new UpdateRequest();
            updateRequest.index(Constants.URL_TABLE_NAME);
            updateRequest.type(Constants.ES_TYPE);
            updateRequest.id(documentID);
            updateRequest.doc(jsonBuilder()
                    .startObject()
                        .field("hitrate", hitrate)
                    .endObject());
           response = esCon.client.update(updateRequest).get();
            
        }
        catch(Exception e){
            System.err.println("Exception in updateHitrate " + e.getMessage());
        }
        return responseFlag;
    }
    
    @Override
    public boolean delete(String documentID) {
        DeleteResponse response = new DeleteResponse();
        try {
            response = esCon.client.prepareDelete(Constants.URL_TABLE_NAME,
                    Constants.ES_TYPE, documentID).get();
        } catch (Exception e) {
            System.err.println("Exception in delete " + e.getMessage());
        }

        return response.isFound();
    }

    @Override
    public void closeConnection() {
        this.esCon.closeClient();
    }
}
