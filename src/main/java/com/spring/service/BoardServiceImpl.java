package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper bmapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return bmapper.getListWithPaging(cri);
	}

	@Override
	public void insert(BoardVO vo) {
		log.info("글 등록하기");
		bmapper.insertboard(vo);
	}

	@Override
	public BoardVO selectboard(int bno) {
		log.info("글 읽기");
		return bmapper.read(bno);
	}
	
	@Override
	public int updateboard(BoardVO vo) {
		log.info("글 수정하기");
		return bmapper.updateboard(vo);
	}
	
	@Override
	public int delete(BoardVO vo) {
		log.info("게시글 삭제");
		return bmapper.delete(vo);
	}
}
