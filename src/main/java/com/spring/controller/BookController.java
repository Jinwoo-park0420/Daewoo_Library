package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.BookCriteria;
import com.spring.domain.BookPageVO;
import com.spring.domain.BookVO;
import com.spring.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/book/*")
@Controller
public class BookController {

	@Autowired
	private BookService service;

	@GetMapping("booksearch")
	public void booksearch(Model model, BookCriteria cri) {
		log.info("전체 목록 페이지 요청");
		List<BookVO> list=service.getList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageVO", new BookPageVO(cri, service.totalCnt(cri)));
			}
		
	}

	@GetMapping("newbook")
	public void newbook(Model model, BookCriteria cri) {
		log.info("신간 도서 페이지 요청 "+cri);
		List<BookVO> list=service.newbook(cri);
		

		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageVO", new BookPageVO(cri, service.NewCnt(cri)));
			}
	}

	@GetMapping("recommandbook")
	public void recommandbook(Model model, BookCriteria cri) {
		log.info("추천 도서 페이지 요청");
		List<BookVO> list=service.recommandbook(cri);
		

		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageVO", new BookPageVO(cri, service.RecCnt(cri)));
			}
	}

	@GetMapping("popularbook")
	public void popularbook(Model model, BookCriteria cri) {
		log.info("인기 도서 페이지 요청");
		List<BookVO> list=service.popularbook(cri);
		

		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageVO", new BookPageVO(cri, service.PopCnt(cri)));
			}
	}

	@GetMapping("loanbook")
	public void loanbook(Model model, BookCriteria cri) {
		log.info("대출 급상승 도서 페이지 요청");
		List<BookVO> list=service.loanbook(cri);
		

		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageVO", new BookPageVO(cri, service.LoanCnt(cri)));
			}
	}
	
	@PostMapping(value= {"booksearch","newbook","recommandbook","popularbook","loanbook"})
	public String book_search(String criteria, String keyword, RedirectAttributes rttr, Model model) {
		log.info("도서 검색 실행");
		
		List<BookVO> list=service.book_search(criteria, keyword);
		if(list.isEmpty()) {
			//index 페이지를 띄울 때 보여줄 탭을 선택
			rttr.addFlashAttribute("tab", "search");
			return "redirect:/";
		}else {
			model.addAttribute("list", list);
			return "/book/booksearch";
		}
	}
	
	@GetMapping("bookDetail")
	public void bookDetail(int bookno, Model model) {
		log.info("도서 상세보기... "+bookno);
		BookVO vo=service.bookDetail(bookno);
		model.addAttribute("vo", vo);
		//아직 미완성
		
	}
	@PostMapping("bookDetail")
	public String bookDetailPost(int bookno, Model model) {
		log.info("도서 상세보기... "+bookno);
		BookVO vo=service.bookDetail(bookno);
		model.addAttribute("vo", vo);
		return "/book/bookDetail";
		//아직 미완성
		
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
