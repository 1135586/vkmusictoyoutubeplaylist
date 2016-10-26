package com.heroku.springmvc.controller;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
@ComponentScan
public class IndexController {
      @RequestMapping(method = RequestMethod.GET)
        public String getIndexPage() {
          System.out.println("index page request");
          return "AppPage";
    }
}
