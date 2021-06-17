package com.youngwun.project;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class PasswordEncoderGenerator {

	@Test
	public void test() {

		log.info("test");
		int i = 0;
		while (i < 10) {
			String password = "12345678";
			
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);
	
			log.info("hashedpassword : "+hashedPassword);
			i++;
		}
	} //

} //
