package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/search/*")
@Controller
public class BookController {

	@GetMapping("booksearch")
	public void search() {
		log.info("도서 검색페이지 요청");
	}
	
	@GetMapping("bookapply")
	public void bookapplyGet() {
		log.info("도서 신청페이지 요청");
	}
}
