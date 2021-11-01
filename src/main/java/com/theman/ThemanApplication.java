package com.theman;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class ThemanApplication {

	public static void main(String[] args) {
		SpringApplication.run(ThemanApplication.class, args);
	}

}
