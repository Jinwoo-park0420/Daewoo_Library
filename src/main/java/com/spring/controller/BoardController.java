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

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/boardinfo")
	public void boardinfo() {
		log.info("소통참여 홈페이지 호출");
	}
	
	@GetMapping("/boardmain")
	public void getlist(Model model,Criteria cri) {
		log.info("게시판글 목록 불러오기");
		model.addAttribute("list",service.getList(cri));
	}
	
	@GetMapping("/boardinsert")
	public void insertform() {
		log.info("글쓰기페이지 이동");
	}
	
	@PostMapping("/insert")
	public String insert(BoardVO vo, RedirectAttributes rttr) {
		log.info("글 등록하기"+vo);
		service.insert(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/boardmain";
	}
	
	@GetMapping("/boardread")
	public void read(@RequestParam(value="bno")int bno,Model model) {
		log.info("글 읽기 페이지 이동"+bno+"번 글");
		model.addAttribute("vo", service.selectboard(bno));
		
	}
	@GetMapping("/boardmodify")
	public String modify(BoardVO vo,Model model) {
		log.info("수정 페이지 이동");
		model.addAttribute("vo",service.selectboard(vo.getBno()));
		return "/board/boardmodify";
	}
	
	@PostMapping("/modify")
	public String modifyform(BoardVO vo,RedirectAttributes rttr) {
		log.info("글 수정"+vo);
		
		if(service.updateboard(vo)>0) {
			log.info("수정 성공");
			rttr.addFlashAttribute("result","success");
		}else {
			log.info("수정실패");
		}
		return "redirect:/board/boardmain";
	}
}
