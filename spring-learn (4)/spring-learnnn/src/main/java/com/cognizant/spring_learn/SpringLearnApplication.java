package com.cognizant.spring_learn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class SpringLearnApplication {

	private static final Logger LOGGER = LoggerFactory.getLogger(SpringLearnApplication.class);

	public static void main(String[] args) {
		LOGGER.info("STARTING THE APPLICATION");
		SpringApplication.run(SpringLearnApplication.class, args);
		LOGGER.info("APPLICATION STARTED");
	}

	@RestController
	public static class HelloController {

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
}

