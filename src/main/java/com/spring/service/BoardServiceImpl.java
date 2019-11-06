package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper bmapper;
	
	@Override
	public List<BoardVO> getList() { //목록불러오기
		return bmapper.selectAll();
	}

	@Override
	public boolean insert(BoardVO vo) {
		return bmapper.insertboard();
	}
}
