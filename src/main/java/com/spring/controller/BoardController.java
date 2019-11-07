package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.BoardVO;
import com.spring.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/boardmain")
	public void getlist(Model model) {
		log.info("게시판글 목록 불러오기");
		model.addAttribute("list",service.getList());
	}
	
	@GetMapping("/boardinsert")
	public void insertform() {
		log.info("글쓰기페이지 이동");
	}
}
