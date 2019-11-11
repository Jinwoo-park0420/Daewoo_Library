package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private MemberService service;
	
	@GetMapping("index")
	public String index() {
		log.info("index페이지요청");
		return "redirect:/ ";
	}


	@GetMapping("join")
	public void joinForm() {
		log.info("join페이지 요청");
	}

	@GetMapping("login")
	public void aboutForm() {
		log.info("login페이지 요청");
	}

	@GetMapping("mypage")
	public void memberInfo(String userid, Model model) {
		log.info("mypage페이지 요청");		
		
	}

	@PostMapping("/join")
	public String join(MemberVO vo, String addr1, String addr2) {
		log.info("회원가입 실행 요청");
		System.out.println(vo);
		vo.setAddress(addr1 + " " + addr2);
		int result = service.memberJoin(vo);
		if (result > 0) {
			// 성공시 메인화면
			return "redirect:/";
		}
		// 실패시 원래화면
		return "join";
	}

	@PostMapping("login")
	public String login(LoginVO vo, RedirectAttributes rttr, Model model) {
		log.info("로그인 요청");
		LoginVO vo1 = service.login(vo);

		int managergrade = vo1.getGrade();

		System.out.println("회원등급" + managergrade);
		if (managergrade == 1) {
			log.info("관리자페이지요청");
			model.addAttribute("vo1", vo1);
			return "redirect:/manager/managermain";
		} else {

			if (vo1 != null) {
				model.addAttribute("vo1", vo1);
				return "redirect:/";

			} else {
				rttr.addFlashAttribute("error", "아이디혹은 비밀번호가 잘못되었습니다.");
				return "member/login";
			}

		}
	}

	@GetMapping("/logout")
	public String logout(SessionStatus session) {
		log.info("로그아웃 처리 메세지");

		// iscomplete는 미리 저장되어있는 session이 있는지 체크
		// 세션이 있다면 삭제
		if (!session.isComplete()) {
			session.setComplete();
		}

		return "redirect:/index";

	}

	@RequestMapping(value = "/ck_userid", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String userid) {
		// userid = request.getParameter("userid");
		log.info("아이디 중복 " + userid);
		if (service.idCheck(userid)) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@GetMapping("/update")
	public String update() {
		log.info("update 페이지로 이동합니다.");
		return "/member/update";
	}
	
	
	
	@GetMapping("/leave")
	public String leave() {
		log.info("회원탈퇴 페이지로 이동합니다.");
		return "/member/leave";
	}
	
	
	
	@GetMapping("/chPwd")
	public String chPwd() {
		log.info("비밀번호 변경 페이지로 이동");
		return "/member/chPwd";
	}
	
	

}
