package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper bmapper;
	
	@Override
	public List<BoardVO> getList() { //목록불러오기
		log.info("리스트 불러오기");
		return bmapper.getList();
	}

	@Override
	public void insert(BoardVO vo) {
		log.info("글 등록하기");
		bmapper.insertboard(vo);
	}
}
