package com.heroku.springmvc.service;

import com.heroku.springmvc.controller.VkYoutubeController;
import com.heroku.springmvc.model.Song;

import java.util.List;
import java.util.concurrent.BlockingQueue;

public class Producer implements Runnable {

    private BlockingQueue<Song> queue;
    List<Song> songs;

    public Producer(BlockingQueue<Song> q, List<Song> songs) throws InterruptedException{
        this.queue=q;
        this.songs = songs;
    }
    @Override
    public void run() {
        //produce messages

        for (int i = 0; i < songs.size(); i++) {
            Song song = songs.get(i);
            Song fetchedSong = YouService.fetchHash(song);
            if (fetchedSong.getResourceId() == null) {
                continue;
            }
            try {
                queue.put(fetchedSong);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }

    }

}