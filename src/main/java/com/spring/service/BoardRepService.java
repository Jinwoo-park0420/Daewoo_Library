package com.spring.service;

import com.spring.domain.BoardRepVO;
import com.spring.domain.Criteria;
import com.spring.domain.ReplyPageDTO;

public interface BoardRepService {
	
	public boolean insert(BoardRepVO vo);
	public ReplyPageDTO list(Criteria cri,int bno);
	public int getCountBno(int bno);
	public BoardRepVO read(int rno);
	public boolean del(int rno);
	public boolean update(BoardRepVO vo);
}
