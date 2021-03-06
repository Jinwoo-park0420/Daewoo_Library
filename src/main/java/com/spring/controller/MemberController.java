package com.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
import com.spring.domain.Book_reportVO;
import com.spring.domain.ChangeVO;
import com.spring.domain.Criteria;
import com.spring.domain.EmailVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberUpdateVO;
import com.spring.domain.MemberVO;
import com.spring.domain.PageVO;
import com.spring.service.BoardService;
import com.spring.service.BookService;
import com.spring.service.Book_reportService;
import com.spring.service.EmailSender;
import com.spring.service.MemberService;

import lombok.extern.slf4j.Slf4j;

//@SessionAttributes("vo1")
@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private BoardService boardservice;
	
	@Autowired
	private Book_reportService reportservice;
	
	@Autowired
	private BookService bookservice;
	
	@Autowired
	private EmailSender emailSender;

	@Autowired
	private EmailVO email;
	
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

	@GetMapping(value= {"mypage","update"})
	public void memberInfo(Model model, HttpSession session) {
		log.info("mypage페이지 요청");
		
		//sessiion에서 id 가져오기
		LoginVO vo =(LoginVO) session.getAttribute("vo1");
		//아이디 를 이용해서 mypage 에 보여줄 정보 요청
		String userid = vo.getUserid();
		MemberVO vo1 =service.memberinfo(userid);
		log.info("vo1"+vo1);
		//받아온 정보를 모델에 담고 페이지 이동
		model.addAttribute("modelVO", vo1);
		
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
	public String login(LoginVO vo, RedirectAttributes rttr, HttpSession session) {
		log.info("로그인 요청");	
		
		LoginVO vo1 = service.login(vo);
		if(vo1!=null)
			session.setAttribute("vo1", vo1);
		else {
			
			rttr.addFlashAttribute("message","아이디 혹은 비밀번호가 틀렸습니다.");
			return "/member/login";
		}
		
		int managergrade = vo1.getGrade();
		
		System.out.println("회원등급" + managergrade);
		
		
		if (managergrade == 1) {
			log.info("관리자페이지요청");
			rttr.addFlashAttribute("message","관리자 페이지입니다.");
			return "redirect:/manager/managermain";
		} else {
			rttr.addFlashAttribute("message",vo.getUserid()+" 님 환영합니다.");
				return "redirect:/";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		log.info("로그아웃 처리 메세지");

		session.invalidate();
		rttr.addFlashAttribute("message","로그아웃이 되었습니다.");
		return "redirect:/";
	}
	
	@PostMapping(value = "/ck_userid")
	@ResponseBody
	public String idCheck(String userid) {
		System.out.println("sddsdsd");
		
		// userid = request.getParameter("userid");
		System.out.println("아이디 중복 !!!!!!!!!!!!!!!!!!!" + userid);
		log.info("아이디 중복 111!!!!!!!!!!!" + userid);
		if (service.idCheck(userid)) {
			return "true";
		} else {
			return "false";
		}
	}
	
	
	@PostMapping("/update")
	public String updatePost(MemberVO member, HttpSession session, MemberUpdateVO update) {
		log.info("회원정보 수정 실행");
		if(service.memberupdate(update)) {
			member.setName(update.getName());
			member.setEmail(update.getEmail());
			member.setPhone_number(update.getPhone_number());
		}
		return "/index"; 
	}
	
	
	@GetMapping("/leave")
	public String leave() {
		log.info("회원탈퇴 페이지로 이동합니다.");

		return "/member/leave";
	}
	
	@PostMapping("/leave")
	public String leavePost(HttpSession session, ChangeVO change) {
		log.info("회원탈퇴 실행"+change);
		LoginVO vo = (LoginVO) session.getAttribute("vo1");
		String password = vo.getPassword();
		if(password.equals(change.getCurrent_password())) {
			if(change.getCurrent_password().equals(change.getConfirm_password())) {
				service.memberdelete(change);
				session.invalidate();
			}
		}
		return "/index";
	}
	
	
	@GetMapping("/chPwd")
	public String chPwd() {
		log.info("비밀번호 변경 페이지로 이동");
		
		return "/member/chPwd";
	}
	
	
	@PostMapping("/chPwd")
	public String chPwdPost(ChangeVO change, HttpSession session) {
		log.info("비밀번호 변경 ");
		LoginVO vo =(LoginVO) session.getAttribute("vo1");
		change.setUserid(vo.getUserid());
		if(change.getNew_password().equals(change.getConfirm_password()))
			{				
				boolean flag=service.pwdupdate(change);
				if(flag) {
					session.invalidate();
					return "/index";
				} else
					return "/member/chPwd";
		}else {
			return "/member/chPwd";
		}
	}
	
	//비밀번호 분실
	@GetMapping("/email")
	public String emailPassword() {
		
		return "/member/email";
	}
	
	@PostMapping("/email")
	public ModelAndView sendEmailPassword (@RequestParam Map<String, Object> paramMap, ModelMap model, LoginVO vo, MemberVO member) throws Exception {
		ModelAndView mav;
        String userid=(String) paramMap.get("userid");
        EmailVO email=(EmailVO) paramMap.get("email");
        String password = vo.getPassword();
        if(password!=null) {
            email.setContent("비밀번호는 "+password+" 입니다.");
            email.setReceiver(member.getEmail());
            email.setSubject(userid+"님 비밀번호 찾기 메일입니다.");
            emailSender.SendEmail(email);
            mav= new ModelAndView("/member/email");
            return mav;
        }else {
            mav=new ModelAndView("redirect:/");
            return mav;
        }
	}
	
	@GetMapping("/lendlist")
	public String lendlist(Model model,BoardVO boardvo,Criteria cri,MemberVO vo) {
		
		
		log.info("내 활동 불러오기");
			
		 List<BoardVO> list = boardservice.getList(cri);
		 List<Book_reportVO> reportlist=reportservice.book_reportList(cri);
		 System.out.println("이찬해씨꺼"+list);
		 System.out.println("박진우씨꺼"+reportlist);
		 
		 if(!list.isEmpty()) {
			 log.info("여기까진 돔1");
				model.addAttribute("list",list);
				model.addAttribute("pageVO",new PageVO(cri,boardservice.totalCnt(cri)));
			}
		
		  if(!reportservice.book_reportList(cri).isEmpty()) { log.info("여기까진 돔2");
		  model.addAttribute("reportlist",reportlist); }
		 
		 
			//model.addAttribute("booklist",bookservice.getList(cri));
			
			
//			return "redirect:/member/memberactive?type='W'&keyword="+vo.getUserid();
			return "/member/memberactive?type='w'keyword="+vo.getUserid();
	}

	@GetMapping("mypageinfo")
	public void mypageinfo(Model model,Book_reportVO report,BoardVO board) {
		log.info("mypageinfo요청"+report);
		List<Book_reportVO> reportlist=service.reportinfo(report);
		List<BoardVO> boardlist =service.boardinfo(board);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("reportlist",reportlist);
	}
}
