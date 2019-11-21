package com.spring.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.ApplyBookVO;

import com.spring.domain.BoardVO;

import com.spring.domain.BookVO;
import com.spring.domain.Criteria;

import com.spring.domain.PageVO;

import com.spring.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/book/*")
@Controller
public class BookController {

	@Autowired
	private BookService service;

	@GetMapping("booksearch")
	public void booksearch(Model model, Criteria cri) {
		log.info("전체 목록 페이지 요청");
		cri.setAmount(5);
		List<BookVO> bList=service.getList(cri);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			PageVO page=new PageVO(cri, service.totalCnt(cri));
			log.info("pageVO controller "+page);
			model.addAttribute("pageVO", page);
			}
		
	}

	@GetMapping("newbook")
	public void newbook(Model model, Criteria cri) {
		log.info("신간 도서 페이지 요청 "+cri);
		cri.setAmount(5);
		List<BookVO> bList=service.newbook(cri);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("pageVO", new PageVO(cri, service.NewCnt(cri)));
			}
	}

	@GetMapping("recommandbook")
	public void recommandbook(Model model, Criteria cri) {
		log.info("추천 도서 페이지 요청");
		cri.setAmount(5);
		List<BookVO> bList=service.recommandbook(cri);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("pageVO", new PageVO(cri, service.RecCnt(cri)));
			}
	}

	@GetMapping("popularbook")
	public void popularbook(Model model, Criteria cri) {
		log.info("인기 도서 페이지 요청");
		cri.setAmount(5);
		List<BookVO> bList=service.popularbook(cri);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("pageVO", new PageVO(cri, service.PopCnt(cri)));
			}
	}

	@GetMapping("loanbook")
	public void loanbook(Model model, Criteria cri) {
		log.info("대출 급상승 도서 페이지 요청");
		cri.setAmount(5);
		List<BookVO> bList=service.loanbook(cri);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("pageVO", new PageVO(cri, service.LoanCnt(cri)));
			}
	}
	
	@GetMapping(value= {"bookDetail","bookRental"},produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<BookVO> bookDetail(int bookno) {
		log.info("도서 상세보기(get)... "+bookno);
		BookVO vo=service.bookDetail(bookno);

		return new ResponseEntity<>(vo, HttpStatus.OK);		
	}

	@GetMapping("bookRental")
	@ResponseBody
	public String rentalUpdate(BookVO vo,Model model) {
		log.info("도서 대여신청(get)... "+vo);
		int status=service.rentalUpdate(vo);
		log.info("도서 대여신청(get), 도서상태 => "+status);
		System.out.println("sdfsdf"+status);
		log.info("빌림");
		if(status==0) {
			return "true";
		}
		else {
			int result=service.uupdate(vo.getUserid());
			model.addAttribute("status",result);
		  log.info(vo.getUserid());     	  
		  return "false";			
		}
	}
	
	@PostMapping("bookDetail")
	@ResponseBody
	public String returnUpdate(BookVO vo, Model model) {
		log.info("도서 반납신청(post)... "+vo);
		int status=service.returnUpdate(vo);
		model.addAttribute("bookrent",status);
		log.info("도서 반납신청(post), 도서상태 => "+status);
		if(status==0) {			
			return "true";
		}else {
			int result=service.uupdate(vo.getUserid());
			model.addAttribute("status",result);
			log.info(vo.getUserid());
			return "false";
		}
	}
	
	@GetMapping("bookapply")
	public String bookapplyGet(SessionStatus session, RedirectAttributes rttr) {
		log.info("도서 신청페이지 요청");
	
		return "book/bookapply";
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
