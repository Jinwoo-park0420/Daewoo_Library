package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardRepVO;

public interface BoardRepService {
	
	public void insertReply(BoardRepVO repvo);
	//댓글 조회
	public List<BoardRepVO> readReply(int bno);
}
