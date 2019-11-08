package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	
	@GetMapping("managermain")
	public void ManagerMain() {
		log.info("관리자 메인페이지 요청");
		
	}
	
	
}
