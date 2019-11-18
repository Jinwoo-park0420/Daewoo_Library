package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.BoardRepVO;
import com.spring.domain.Criteria;
import com.spring.domain.ReplyPageDTO;
import com.spring.service.BoardRepService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/replies")
public class BoardRepController {

	@Autowired
	private BoardRepService service;

	@PostMapping("/new")
	public ResponseEntity<String> create(@RequestBody BoardRepVO vo) {
		log.info("댓글 삽입");

		return service.insert(vo) ? new ResponseEntity<String>("Success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}

	@GetMapping(value = "/pages/{bno}/{page}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("bno") int bno, @PathVariable("page") int page) {
		log.info("댓글 리스트 요청");

		Criteria cri = new Criteria(page, 10);

		return new ResponseEntity<>(service.list(cri, bno), HttpStatus.OK);
	}

	@GetMapping(value = "/{rno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<BoardRepVO> get(@PathVariable("rno") int rno) {
		log.info("댓글 하나 출력");

		return new ResponseEntity<>(service.read(rno), HttpStatus.OK);
	}

	@DeleteMapping(value = "/{cno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> del(@PathVariable("cno") int cno) {
		log.info("댓글 삭제");

		return service.del(cno) ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.BAD_REQUEST);

	}
	
	@RequestMapping(value="/{rno}",method= {RequestMethod.PATCH,RequestMethod.PUT})
	public ResponseEntity<String> modify(@PathVariable("cno")int cno,@RequestBody BoardRepVO vo){
		
		log.info("댓글 수정");
		vo.setCno(cno);
		return service.update(vo) ? new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		
	}

}
