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

import com.spring.domain.BoardRepVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.PageVO;
import com.spring.service.BoardRepService;
import com.spring.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	@Autowired
	private BoardRepService repservice;	

	@GetMapping("/boardinfo")		
	public void boardinfo(Model model,Criteria cri) {
		log.info("소통참여 홈페이지 호출");	
		List<BoardVO> list=service.getList(cri);
		model.addAttribute("list",list);
	}
	
	@GetMapping("/boardmain")
	public String getlist(Model model,Criteria cri) {
		log.info("게시판글 목록 불러오기");
		
		List<BoardVO> list=service.getList(cri);
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
			model.addAttribute("pageVO",new PageVO(cri,service.totalCnt(cri)));
		}
		else {
			return "/board/boardmain2";
		}
		return "/board/boardmain";
	}
	
	@GetMapping("/boardmain2")
	public String getlist2() {
		log.info("게시판이 비어있음");
		return "/board/boardmain2";
	}
	
	@GetMapping("/boardsearch")
	public String searchlist(Model model,Criteria cri) {
		log.info("내가 쓴 글 불러오기");
		
		List<BoardVO> list=service.getList(cri);
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
			model.addAttribute("pageVO",new PageVO(cri,service.totalCnt(cri)));
		}
		else {
			return "/board/boardsearchnone";
		}
		return "/board/boardsearch";
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
	
	@GetMapping(value= {"/modify","/boardread"})
	public void read(@RequestParam("bno") int bno,Model model) {
		log.info("글 읽기 페이지 이동"+bno+"번 글");
		model.addAttribute("vo", service.selectboard(bno));
		model.addAttribute("rep",service.readCountupdate(bno));
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
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/boardmain";
	}
	
	
	@GetMapping("/boarddelete")
	public String deleteForm(BoardVO vo,Model model) {
		log.info("삭제 페이지 이동"+vo);
		model.addAttribute("vo",service.selectboard(vo.getBno()));
		return "board/boarddelete";
	}

	@PostMapping("/delete")
	public String delete(BoardVO vo,RedirectAttributes rttr) {
		log.info("글 삭제하기"+vo);

		if(service.delete(vo)>0) {
			log.info("삭제 성공");
			rttr.addFlashAttribute("result","success");
		}else {
			log.info("삭제실패");
		}
		return "redirect:/board/boardmain";
	}
	
	//댓글 작성
		@PostMapping("/replyWrite")
		public String replyInsert(BoardRepVO repvo,RedirectAttributes rttr) {

			log.info("댓글작성"+repvo);
			//repservice.insertReply(repvo);

			rttr.addAttribute("bno",repvo.getBno());

			return "redirect:/board/boardread";
		}
}
