package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardRepVO;
import com.spring.domain.Criteria;

public interface BoardRepMapper {

	public int insertReply(BoardRepVO vo);
	public List<BoardRepVO> getlist(@Param("cri")Criteria cri,@Param("bno")int bno);
	public int getCountBno(int bno);
	public BoardRepVO read(int rno);
	public int del(int rno);
	public int update(BoardRepVO vo);
}
