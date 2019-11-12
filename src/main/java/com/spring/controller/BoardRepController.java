package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardRepVO;
import com.spring.service.BoardRepService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardRepController {

	@Autowired
	private BoardRepService repservice;
	
	@PostMapping("/addreply")
	public String insertReply(BoardRepVO repvo,Model model,RedirectAttributes rttr) {
		log.info("댓글 입력");
		return "";
	}
}
