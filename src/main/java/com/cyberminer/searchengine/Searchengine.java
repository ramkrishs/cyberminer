package com.cyberminer.searchengine;


public class Searchengine {

    private String id;
    private String url;
    private String description;
    private int hitrate;
    private int totalhits;

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the hitrate
     */
    public int getHitrate() {
        return hitrate;
    }

    /**
     * @param hitrate the hitrate to set
     */
    public void setHitrate(int hitrate) {
        this.hitrate = hitrate;
    }

    /**
     * @return the totalhits
     */
    public int getTotalhits() {
        return totalhits;
    }

    /**
     * @param totalhits the totalhits to set
     */
    public void setTotalhits(int totalhits) {
        this.totalhits = totalhits;
    }

}
