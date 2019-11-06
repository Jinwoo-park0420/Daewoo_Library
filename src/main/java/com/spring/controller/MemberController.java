package com.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@SessionAttributes("vo1")
@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	
	@Autowired
	public MemberService service;
	

	@GetMapping("join")
	public void joinForm() {
		log.info("join페이지 요청");
	}
	@GetMapping("login")
	public void aboutForm() {
		log.info("login페이지 요청");
	}
	@GetMapping("mypage")
	public void postForm() {
		log.info("mypage페이지 요청");
	}
	@PostMapping("/join")
	public String join(MemberVO vo, String addr1, String addr2, String jumin1, String jumin2) {
		log.info("회원가입 실행 요청");
		System.out.println(vo);
		
		vo.setAddress(addr1+" "+addr2);
		//vo.setJumin(jumin1+" "+jumin2);
		
		int result=service.memberJoin(vo);
		if(result>0)
		{
			//성공시 메인화면
			return "redirect:/";
		}
		//실패시 원래화면
		return "join";
	}
	
	@RequestMapping
	public String login(LoginVO vo,RedirectAttributes rttr, Model model) {
		log.info("로그인 요청");
		LoginVO vo1=service.login(vo);
		if(vo1!=null) {
			model.addAttribute("vo1",vo1);
			return "redirect:/";
		
		
		}else {
			rttr.addFlashAttribute("error","아이디혹은 비밀번호가 잘못되었습니다.");
			return "redirect:/login";
		}
			
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus session) {
		log.info("로그아웃 처리 메세지");

		//iscomplete는 미리 저장되어있는 session이 있는지 체크 
		//세션이 있다면 삭제
		if (!session.isComplete()) {
			session.setComplete();
		}

		return "redirect:/index";

	}
	
	
	
}
