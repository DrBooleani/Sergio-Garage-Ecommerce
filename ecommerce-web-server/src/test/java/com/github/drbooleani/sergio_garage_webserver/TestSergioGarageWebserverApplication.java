package com.github.drbooleani.sergio_garage_webserver;

import org.springframework.boot.SpringApplication;

public class TestSergioGarageWebserverApplication {

	public static void main(String[] args) {
		SpringApplication.from(SergioGarageWebserverApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
