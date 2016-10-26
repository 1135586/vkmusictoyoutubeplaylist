package com.heroku.springmvc.service;

/**
 * Created by root on 17.10.16.
 */
public class CaptchaException extends Exception{
    public CaptchaException() {
    }

    public CaptchaException(String capthca) {

        super(capthca);
    }
}
