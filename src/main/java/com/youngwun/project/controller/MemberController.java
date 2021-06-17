package com.youngwun.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("member")
public class MemberController {
	
	@RequestMapping("join")
	public String join() {
		log.info("회원가입");
		return "member/member_join";
	}

}
