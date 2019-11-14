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
import com.spring.domain.Criteria;
import com.spring.domain.PageVO;
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
	public String getlist(Model model,Criteria cri) {
		log.info("게시판글 목록 불러오기");
		
		List<BoardVO> list=service.getList(cri);
		
		if(!list.isEmpty()) {
		model.addAttribute("list",list);
		model.addAttribute("pageVO",new PageVO(cri,service.totalCnt(cri)));
		}
			
		return "/board/boardmain";
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
	
	@GetMapping(value= {"/boardread","/modify"})
	public void read(@RequestParam("bno") int bno,Model model) {
		log.info("글 읽기 페이지 이동"+bno+"번 글");
		model.addAttribute("vo", service.selectboard(bno));
		
	}
	
	@PostMapping("/modify")
	public String modifyform(BoardVO vo,RedirectAttributes rttr) {
		log.info("글 수정"+vo);
		
		if(service.updateboard(vo)>0) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/boardmain";
	}
}
