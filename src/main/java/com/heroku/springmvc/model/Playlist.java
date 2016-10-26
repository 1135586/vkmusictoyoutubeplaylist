package com.heroku.springmvc.model;

/**
 * Created by root on 20.09.16.
 */
public class Playlist {
    private String name;

    public Playlist(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
