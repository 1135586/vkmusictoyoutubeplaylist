package com.heroku.springmvc.service;

import com.heroku.springmvc.model.Song;

import java.util.concurrent.BlockingQueue;

public class Consumer implements Runnable{

    private BlockingQueue<Song> queue;
    private String playlistname;

    public Consumer(BlockingQueue<Song> q, String playlistname){
        this.queue=q;
        this.playlistname = playlistname;
    }

    @Override
    public void run() {
        try{
            while (queue != null) {
                YouService.saveToPlaylistSong(playlistname, queue.take());
            }
        }catch(InterruptedException e) {
            e.printStackTrace();
        }
    }
}
