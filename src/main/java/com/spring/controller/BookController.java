package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.ApplyBookVO;
import com.spring.service.BookService;
import com.spring.service.BookServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/book/*")
@Controller
public class BookController {

	@Autowired
	private BookService service;

	@GetMapping("booksearch")
	public void search() {
		log.info("도서 검색페이지 요청");
	}

	@GetMapping("bookapply")
	public String bookapplyGet(SessionStatus session, RedirectAttributes rttr) {
		log.info("도서 신청페이지 요청");
		if (!session.isComplete()) {
			return "book/bookapply";
			
		} else {
			rttr.addFlashAttribute("error", "로그인을 실행 후 이용바랍니다.");
			return "redirect:/member/login";
		}
	}

	@PostMapping("apply")
	public String bookApplyVoid(ApplyBookVO Apply, String publish_year_yy, String publish_year_mm
			) {
		log.info("도서 신청");
		System.out.println("희망도서목록" + Apply);
		Apply.setPublish_year(publish_year_yy + publish_year_mm);

			int result = service.ApplyBook(Apply);
			if (result != 0) {

				return "redirect:/";
			} else {

				return "bookapply";
			}
	}
}
