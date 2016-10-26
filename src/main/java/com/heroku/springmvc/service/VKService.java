package com.heroku.springmvc.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import com.heroku.springmvc.model.Song;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.context.annotation.Scope;
import org.springframework.web.client.RestTemplate;
@Scope("session")
public class VKService {

    public static String sid;
    public static String img;

    public static List<Song> getVkontakteSongs(String token) {
        ArrayList<Song> songs = new ArrayList<Song>();

        URI uri = buildUriForGetAudio(token);

        String responseAudionAsString = (new RestTemplate()).getForObject(uri, String.class);

        try {
            JSONObject jsonAudio = (JSONObject) (new JSONParser()).parse(responseAudionAsString);

            JSONObject error = (JSONObject) jsonAudio.get("error");
            JSONArray audioArr = (JSONArray) jsonAudio.get("response");

            if (error != null) {
                sid = (String) error.get("captcha_sid");
                img = (String) error.get("captcha_img");
                return songs;

            } else {

                for (int i = 0; i < audioArr.size(); i++) {
                    try {
                        JSONObject audioObject = (JSONObject) audioArr.get(i);
                        songs.add(new Song((String) audioObject.get("title"), (String) audioObject.get("artist")));
                    } catch (NullPointerException e) {
                        e.printStackTrace();
                    }
                }
                return songs;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Song> getVkontakteSongs(String token, String sid, String key) {
        ArrayList<Song> songs = new ArrayList<Song>();

        URI uri = buildUriForGetAudio(token, sid, key);

        String responseAudionAsString = (new RestTemplate()).getForObject(uri, String.class);

        try {
            JSONObject jsonAudio = (JSONObject) (new JSONParser()).parse(responseAudionAsString);

            JSONObject error = (JSONObject) jsonAudio.get("error");
            JSONArray audioArr = (JSONArray) jsonAudio.get("response");

            if (error != null) {
                sid = (String) error.get("captcha_sid");
                img = (String) error.get("captcha_img");
                return songs;

            } else {

                for (int i = 0; i < audioArr.size(); i++) {
                    try {
                        JSONObject audioObject = (JSONObject) audioArr.get(i);
                        songs.add(new Song((String) audioObject.get("title"), (String) audioObject.get("artist")));
                    } catch (NullPointerException e) {
                        e.printStackTrace();
                    }
                }
                return songs;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;

    }

    public static String getToken(String code) {

        String urlForAccessToken = "https://oauth.vk.com/access_token?client_id=5634355&client_secret=s1ZC77w7NO9FidFOEnRK&redirect_uri=http://test.handmug.ru/vkmusictoyoutubeplaylist/redirectVk&code=" + code;

        try {
            String rawToken = (new RestTemplate()).getForObject(new URI(urlForAccessToken), String.class);

            JSONObject jsonToken = (JSONObject) (new JSONParser()).parse(rawToken);
            String accessToken = (String) jsonToken.get("access_token");

            System.out.println("ACCESS TOKEN = " + accessToken);
            return accessToken;
        } catch (URISyntaxException | ParseException e) {
            e.printStackTrace();
        }

        return "";
    }

    public static URI buildUriForGetAudio(String token) {

        try {
            URI uriForAudioGet = new URI("https://api.vk.com/method/audio.get?access_token=" + token);
            return uriForAudioGet;
        } catch (URISyntaxException e) {

            e.printStackTrace();
        }
        return null;

    }

    public static URI buildUriForGetAudio(String token, String captcha_sid, String captcha_key) {

        try {
            URI uriForAudioGet = new URI("https://api.vk.com/method/audio.get?access_token=" + token + "&captcha_sid=" + captcha_sid + "&captcha_key=" + captcha_key);
            return uriForAudioGet;
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        return null;
    }
}


