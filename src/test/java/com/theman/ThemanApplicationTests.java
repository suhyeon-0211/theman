package com.theman;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.theman.test.bo.TestBO;

@SpringBootTest
class ThemanApplicationTests {
	
	private Logger logger = LoggerFactory.getLogger(ThemanApplicationTests.class);
	
	@Autowired
	private TestBO testBO;
	
	@Test
	void contextLoads() {
		logger.info("### Hello World!!! ###");
	}

	@Test
	void 더하기테스트() {
		logger.info("$$$$ 더하기 테스트 시작!!!");
		int a = 10;
		int b = 20;
		assertEquals(30, sum(a, b));
	}
	
	int sum(int x, int y) {
		return x + y;
	}
	
	@Transactional // insert, delete 등등 에러 발생시 롤백 
	@Test
	void 디비테스트() {
		assertNotNull(testBO.getReview());
	}
}
