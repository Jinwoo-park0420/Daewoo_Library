package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.Book_reportVO;
import com.spring.service.Book_reportService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/book_report/*")
public class Book_reportController{
	
	@Autowired
	private Book_reportService service;
		
	@GetMapping("book_reportmain")
	public void book_reportMain(Model model) {
		log.info("독후감 메인페이지 요청");
		List<Book_reportVO> list=service.book_reportList();
		System.out.println(list);
		
		model.addAttribute("list",list);
		
	}
	
	@GetMapping("book_reportinsert")
	public void book_reportInsertGet() {
		log.info("독후감작성 페이지 요청");
	}
	
	@PostMapping("book_reportinsert")
	public String book_reportInsertPost(Book_reportVO report) {
		log.info("독후감 등록 요청");
		int result=service.book_reportinsert(report);
		if(result>0) {
			
			return "redirect:/book_report/book_reportmain";
		}
		else {
			return "book_report/book_reportinsert";
		}
	}
	@GetMapping("book_reportread")
	public String book_reportreadGet(int bno,Model model) {
		
		Book_reportVO report_select=service.book_reportSelectList(bno);
		model.addAttribute("report_select",report_select);
		return "book_report/book_reportread";
	}
	
	public void book_reportmodify() {
		log.info("수정페이지요청");
	}
}
