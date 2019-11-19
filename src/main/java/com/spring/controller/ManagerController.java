package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MemberVO;
import com.spring.service.ManagerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	
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
}
