package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/library/*")
public class LibraryInfoController {

	@GetMapping("libraryinfo")
	public void libraryInfo() {
		log.info("도서관정보페이지 이동");
	}
	
}
