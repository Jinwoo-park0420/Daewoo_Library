package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getListWithPaging(Criteria cri);
	public boolean insertboard(BoardVO vo);
	public BoardVO read(int bno);
	public int updateboard(BoardVO vo);
	
	
}
