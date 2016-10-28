package com.heroku.springmvc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

import com.heroku.springmvc.model.Playlist;
import com.heroku.springmvc.model.Song;
import com.heroku.springmvc.service.Consumer;
import com.heroku.springmvc.service.Producer;
import com.heroku.springmvc.service.VKService;
import com.heroku.springmvc.service.YouService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("session")
public class VkYoutubeController {

    private List<Song> songs;
    private List<Playlist> playlists;
    private String tokenVk;

    @RequestMapping(value = "/captcha", method = RequestMethod.GET, params = {"sid", "key"})
    public ModelAndView captcha(@RequestParam(value = "sid") String sid, @RequestParam(value = "key") String key) {

        this.songs = VKService.getVkontakteSongs(tokenVk, sid, key);

        ModelAndView model = new ModelAndView();

        if (playlists == null) {
            playlists = new ArrayList<Playlist>();
        }
        model.addObject("playlists", playlists);
        model.addObject("lists", this.songs);
        model.setViewName("AppPage");
        return model;
    }

    @RequestMapping(value = "/redirectVk", method = RequestMethod.GET, params = {"code"})
    public ModelAndView getTokenAndCaptcha(@RequestParam(value = "code") String code) {

        tokenVk = VKService.getToken(code);

        this.songs = VKService.getVkontakteSongs(tokenVk);

        if (this.songs.size() == 0) {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("captcha_sid", VKService.sid);
            modelAndView.addObject("captcha_img", VKService.img);
            modelAndView.setViewName("CaptchaHandler");
            return modelAndView;
        }
            ModelAndView model = new ModelAndView();

            if (playlists == null) {
                playlists = new ArrayList<Playlist>();
            }
            model.addObject("playlists", playlists);
            model.addObject("lists", this.songs);
            model.setViewName("AppPage");
            return model;
    }

    @RequestMapping(value = "/redirectYou", method = RequestMethod.GET, params = {"code"})
    public ModelAndView getTokenYou(@RequestParam(value = "code") String code){

        playlists = YouService.getYoutubePlaylists(code);

        ModelAndView model = new ModelAndView();
        model.setViewName("AppPage");

        if (this.songs == null) {
            this.songs = new ArrayList<Song>();
        }
        model.addObject("lists", this.songs);
        model.addObject("playlists", playlists);

        return model;
    }

    @RequestMapping(value = "/convert/{playlistname}",method = RequestMethod.GET)
    public ModelAndView convert(@PathVariable("playlistname")String playlistname){


        String playlistId = YouService.createPlaylistOnYoutube(playlistname);

        try {
            //Creating BlockingQueue of size 10
            BlockingQueue<Song> queue = new ArrayBlockingQueue<>(10);
            Producer producer = new Producer(queue, songs);
            Consumer consumer = new Consumer(queue, playlistId);
            //starting producer to produce messages in queue
            new Thread(producer).start();
            //starting consumer to consume messages from queue
            new Thread(consumer).start();
            System.out.println("Producer and Consumer has been started");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
/*
        new Thread(new Runnable() {
            @Override
            public void run() {
                List<Song> songs = YouService.searchVideosOnYoutube(VkYoutubeController.this.songs);

                YouService.saveToPlaylist(playlistname, songs);
            }
        }).start();
*/

        if (playlists == null) {
            playlists = new ArrayList<Playlist>();
        }
        if (this.songs == null) {
            this.songs = new ArrayList<Song>();
        }

        ModelAndView model = new ModelAndView();
        model.setViewName("Con");
        return model;
    }
}
