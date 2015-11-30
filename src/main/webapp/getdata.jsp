<%@page import="com.cyberminer.elasticsearchDB.ElasticsearchClient"%>
<%@page import="com.cyberminer.elasticsearchDB.ElasticSearch"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>


<%
    ElasticsearchClient esobj = new ElasticsearchClient();
 
    List<String> token = esobj.getKeywords();
    
    Iterator<String> iterator = token.iterator();
    while(iterator.hasNext()) {
        String keyword = (String)iterator.next();
        out.println(keyword);
    }
%>
