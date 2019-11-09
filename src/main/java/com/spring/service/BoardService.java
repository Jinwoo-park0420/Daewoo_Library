package com.spring.service;

import java.util.List;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;


public interface BoardService {

	public List<BoardVO> getList(Criteria cri);
	public void insert(BoardVO vo);
	public BoardVO selectboard(int bno);
}
