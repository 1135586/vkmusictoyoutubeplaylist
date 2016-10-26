package com.heroku.springmvc.model;

import java.util.HashMap;

/**
 * Created by root on 06.09.16.
 */
public class Song {
    private String title;
    private String artist;
    private String hash = "";
    private HashMap<String, String> resourceId = null;

    public Song(String title, String artist) {
        this.title = title;
        this.artist = artist;
    }

    public HashMap<String, String> getResourceId() {
        return resourceId;
    }
    public void setResourceId(HashMap<String, String> resourceId) {
        this.resourceId = resourceId;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    @Override
    public String toString() {
        return title + " - " + artist;
    }
}
