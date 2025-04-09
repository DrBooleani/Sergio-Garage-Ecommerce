package com.github.drbooleani.sergio_garage_webserver;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;

@Import(TestcontainersConfiguration.class)
@SpringBootTest
class SergioGarageWebserverApplicationTests {

	@Test
	void contextLoads() {
	}

}
