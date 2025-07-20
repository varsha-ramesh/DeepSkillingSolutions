package com.cognizant.spring_learn.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    private static final Logger LOGGER = LoggerFactory.getLogger(HelloController.class);

    @GetMapping("/")
    public String home() {
        LOGGER.info("Accessed / endpoint");
        return "Welcome to Spring Learn!";
    }

    @GetMapping("/hello")
    public String hello() {
        LOGGER.info("Accessed /hello endpoint");
        return "Hello, Spring Learner!";
    }
}
