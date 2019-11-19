package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.BookVO;
import com.spring.domain.Book_reportVO;
import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.service.Book_reportService;
import com.spring.service.ManagerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	@Autowired
	private Book_reportService book_reportservice;
	@Autowired
	private Book_reportService reportservice;
	
	@Autowired
	private ManagerService service;
	
	@GetMapping("managermain")
	public void ManagerMain() {
		log.info("관리자 메인페이지 요청");
		
	}
	@GetMapping("managerList")
	public void ManagerList(Model model) {
		log.info("회원관리페이지 이동");
		List<MemberVO> ManagerList=service.ManagerList();
	System.out.println("회원목록"+ManagerList);
		model.addAttribute("ManagerList",ManagerList);
		
	}
	@GetMapping("managerread")
	public void ManagerRead(MemberVO member,Model model) {
		log.info("회원상세보기");
		MemberVO ManagerRead =service.ManagerRead(member);
		model.addAttribute("ManagerRead",ManagerRead);
	}
	
	@PostMapping("managerdelete")
	public String ManagerDelete(MemberVO member,RedirectAttributes rttr) {
		log.info("회원강제로 탈퇴시키기");
		service.ManagerDelete(member);
			rttr.addFlashAttribute("ManagerDelete","회원을 강제로 탈퇴시켰습니다.");
			return "redirect:/manager/managerList";
			
		
		}
	@GetMapping("managerapplyList")
	public void managerapplyList(Model model) {
		log.info("도서신청목록페이지 요청");
		model.addAttribute("applyList",service.ManagerApplyList());
	}
	
	@GetMapping("managerapply")
	public void managerapply(Model model,ApplyBookVO apply) {
		log.info("도서신청 페이지");
		
		model.addAttribute("apply",service.apply(apply));
		
	}
	
	@PostMapping("managerapply")
	public String managerapply(Model model,BookVO book,ApplyBookVO apply) {
		log.info("책 신청"+ book);
			int result=	service.book_insert(book);
			if(result >0) {
				log.info("apply확인"+apply);
				service.statusChange(apply);
				return "redirect:/manager/managerapplyList";
			}
				
			return "";
	}
	@GetMapping("managerinfo")
	public void managerinfo() {
		log.info("관리자 게시판 홈페이지");
	}
	@GetMapping("managerreport")
	public void managerreport(Model model,Criteria cri) {
		log.info("관리자 독후감 페이지");		
		model.addAttribute("Managerreport", reportservice.book_reportList(cri));
	}
	
	@GetMapping("managerreportread")
	public void book_reportreadGet(@RequestParam(value="bno")int bno,Model model,@ModelAttribute("cri") Criteria cri) {
		Book_reportVO report_select=book_reportservice.book_reportSelectList(bno);
		model.addAttribute("report_select",report_select);
		model.addAttribute("cri",cri);
	}
	
}
