package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardRepVO;

public interface BoardRepMapper {

	public void insertReply(BoardRepVO repvo);
	
	public List<BoardRepVO> readReply(int bno);
}
