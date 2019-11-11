package com.spring.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.spring.domain.BoardVO;
import com.spring.domain.Book_reportVO;
import com.spring.service.Book_reportService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/book_report/*")
@Controller
public class Book_reportController{
	
	@Autowired
	private Book_reportService service;
		
	@GetMapping("book_reportmain")
	public void book_reportMain(Model model) {
		log.info("독후감 메인페이지 요청");
		
		model.addAttribute("list",service.book_reportList());
		
	}
	
	@GetMapping("book_reportinsert")
	public void book_reportInsertGet() {
		log.info("독후감작성 페이지 요청");
	}	
	
	@PostMapping("book_reportinsert")
	public String book_reportInsertPost(Book_reportVO report, RedirectAttributes rttr) {
		log.info("독후감 등록 요청");
		int result=service.book_reportinsert(report);
		if(result>0) {
			rttr.addFlashAttribute("result", report.getBno());
			return "redirect:/book_report/book_reportmain";
		}
		else {
			return "book_report/book_reportinsert";
		}
	}	
	@GetMapping("book_reportread")
	public String book_reportreadGet(@RequestParam(value="bno")int bno,Model model) {
		Book_reportVO report_select=service.book_reportSelectList(bno);
		model.addAttribute("report_select",report_select);
		return "book_report/book_reportread";
	}	
}		