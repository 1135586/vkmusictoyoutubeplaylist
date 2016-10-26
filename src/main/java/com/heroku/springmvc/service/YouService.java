package com.heroku.springmvc.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.*;
import java.util.stream.Collectors;
import com.heroku.springmvc.model.Song;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class YouService {


    private static final String VIDEO_ID = "SZj6rAYkYOg";


    private String BaseUrl = "";

    private static String accessTokenYoutube = "";

    public static List<com.heroku.springmvc.model.Playlist> getYoutubePlaylists(String code) {

        List<com.heroku.springmvc.model.Playlist> playlists = new ArrayList<>();

        String urlForAccessTokenForPostQuery = "https://accounts.google.com/o/oauth2/token";


        try {
            RestTemplate restTemplate = new RestTemplate();

            MultiValueMap<String, String> variablesMap = new LinkedMultiValueMap<String, String>();

            variablesMap.add("code", code);
            variablesMap.add("client_id", "784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com");
            variablesMap.add("client_secret", "k3KgJsE378JTT2UHqMAzVyNR");

            variablesMap.add("redirect_uri","http://test.handmug.ru/vkmusictoyoutubeplaylist/redirectYou");
            variablesMap.add("grant_type", "authorization_code");

            ResponseEntity<String> restTemplateResponeAsString = restTemplate.postForEntity(urlForAccessTokenForPostQuery, variablesMap, String.class);
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject) parser.parse(restTemplateResponeAsString.getBody().toString());

            String accessToken = (String) obj.get("access_token");

            accessTokenYoutube = accessToken;

            String urlForPlaylistsList = "https://www.googleapis.com/youtube/v3/playlists?part=snippet&mine=true&access_token=" + accessToken;
            URI uriForPlaylistJson = new URI(urlForPlaylistsList);

            RestTemplate restTemplate1 = new RestTemplate();
            String restTemplateResponseAsStringForPlaylistList = restTemplate1.getForObject(uriForPlaylistJson, String.class);

            JSONParser parser2 = new JSONParser();
            JSONObject obj1 = (JSONObject) parser2.parse(restTemplateResponseAsStringForPlaylistList);

            try {
                JSONArray items = (JSONArray) obj1.get("items");

                for (int i = 0; i < items.size(); i++) {
                    try {
                        JSONObject audioObject = (JSONObject) items.get(i);
                        JSONObject snippet = (JSONObject) audioObject.get("snippet");
                        String title = (String) snippet.get("title");
                        playlists.add(new com.heroku.springmvc.model.Playlist(title));
                    } catch (NullPointerException e) {
                        e.printStackTrace();
                    }
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }

        } catch (URISyntaxException | ParseException e) {
            e.printStackTrace();
        }


        return playlists;

    }


    public static List<Song> searchVideosOnYoutube(List<Song> musicsFromVk) {
        musicsFromVk.stream().map(song -> fetchHash(song)).collect(Collectors.toList());


        List<Song> musics = new ArrayList<Song>();

        for (int i = 0; i < musicsFromVk.size(); i++) {
            Song song = musicsFromVk.get(i);
            Song fetchedSong = fetchHash(song);
            if (fetchedSong.getResourceId() == null) {
                continue;
            }
            musics.add(fetchedSong);
        }

        return musicsFromVk;
    }

    private static synchronized Song fetchHash(Song song) {

        String urlForSearchVideos = "https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&key=AIzaSyD-IXheXXARtFGi1F9iNqunRZWVC3-YP8o";
        String searchWorld = "&q=" + song.getArtist() + " " + song.getTitle();

        RestTemplate restTemplate = new RestTemplate();

        String rawSongObjectCOntainsHash = restTemplate.getForObject(urlForSearchVideos + searchWorld, String.class);

        try {
            JSONObject jsonVideos = (JSONObject) (new JSONParser()).parse(rawSongObjectCOntainsHash);
            JSONArray items = (JSONArray) jsonVideos.get("items");

            if (items.size() == 0) {
                return song;
            } else {
                JSONObject item = (JSONObject) items.get(0);
                System.out.println(item);
            JSONObject id = (JSONObject) item.get("id");
            String hash = (String) id.get("videoId");
            String kind = (String) id.get("kind");

            song.setHash(hash);

            HashMap<String, String> resourceId = new HashMap<>();
            resourceId.put("videoId", hash);
            resourceId.put("kind", kind);
            song.setResourceId(resourceId);
            return song;

            }

        } catch (ParseException e) {
            e.printStackTrace();
        }

        return song;
    }


    public static void saveToPlaylist(String playlistName, List<Song> songs) {
        String playlistId = createPlaylistOnYoutube(playlistName);

        for (int i = 0; i < songs.size(); i++) {
            saveToPlaylistSong(playlistId, songs.get(i));

        }
    }

    private static String createPlaylistOnYoutube(String playlistName) {

        String urlForCreatePlaylist = "https://www.googleapis.com/youtube/v3/playlists?part=snippet&mine=true&key=AIzaSyD-IXheXXARtFGi1F9iNqunRZWVC3-YP8o&access_token=" + accessTokenYoutube;
        HttpClient httpClient = new org.apache.http.impl.client.DefaultHttpClient(); //Use this instead

        try {
            HttpPost request = new HttpPost(urlForCreatePlaylist);

            StringEntity params = new StringEntity(" {\n" +
                    "            \"snippet\": {\n" +
                    "            \"title\": \"" + playlistName + "\", \"description\": \"za 4to eto aaaaaa\"\n" +
                    "}}");

            request.setHeader("Content-type", "application/json");
            request.setEntity(params);
            HttpResponse response = httpClient.execute(request);
            String s = EntityUtils.toString(response.getEntity());
            JSONParser parser = new JSONParser();
            JSONObject myObject = (JSONObject) parser.parse(s);
            String id = (String) myObject.get("id");

            return id;
        } catch (Exception ex) {
        } finally {
            httpClient.getConnectionManager().shutdown(); //Deprecated
        }

        return null;


    }

    private static void saveToPlaylistSong(String playlistId, com.heroku.springmvc.model.Song song) {

        String urlForPlaylistItemInsert = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&key=AIzaSyD-IXheXXARtFGi1F9iNqunRZWVC3-YP8o&access_token=" + accessTokenYoutube;
        HttpClient httpClient = new org.apache.http.impl.client.DefaultHttpClient(); //Use this instead

        try {
            HttpPost request = new HttpPost(urlForPlaylistItemInsert);
            String param = "{\"snippet\":{\"playlistId\":\"" + playlistId + "\",\"resourceId\":{\"videoId\":\"" + song.getResourceId().get("videoId")+ "\",\"kind\":\"" + song.getResourceId().get("kind") + "\"}}}";
            StringEntity params = new StringEntity(param);
            request.setHeader("Content-type", "application/json");
            request.setEntity(params);
            HttpResponse response = httpClient.execute(request);
        } catch (Exception ex) {
        } finally {
            httpClient.getConnectionManager().shutdown(); //Deprecated
        }
    }

}

