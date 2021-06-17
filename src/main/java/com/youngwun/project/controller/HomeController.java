package com.youngwun.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		log.info("home");
		return "login/login";
	}
	
	@RequestMapping("login")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/welcome")
	public String welcome() {
		return "login/welcome";
	}
	
	@RequestMapping("/logoutProc")
    public String logout(ModelMap model,
	    					 HttpServletRequest request,
	    					 HttpServletResponse response) {
	    	
    	log.info("logout");
    	
	    Authentication auth 
		    	= SecurityContextHolder.getContext()
		    						   .getAuthentication();
	    
	    log.info("auth : "+auth);
	    
	    // logout !
	    if (auth != null) {    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }

	    return "login/logout";
	}
	

}
