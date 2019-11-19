package com.spring.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.BoardRepVO;
import com.spring.domain.Criteria;
import com.spring.domain.ReplyPageDTO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.BoardRepMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("board")
public class BoardRepServiceImpl implements BoardRepService {

	@Autowired
	private BoardRepMapper repmapper;
	@Inject
	private BoardMapper mapper;
	
	@Override
	public ReplyPageDTO list(Criteria cri, int bno) {
		log.info("댓글 리스트 불러오기");
		return new ReplyPageDTO(repmapper.getCountBno(bno),repmapper.getlist(cri, bno));
	}
	
	@Transactional
	@Override
	public boolean insert(BoardRepVO vo) {
		log.info("댓글 작성");
		mapper.updateReplyCnt(1, vo.getBno()); //댓글갯수
		return repmapper.insertReply(vo)==1?true:false;
	}
	
	@Override
	public int getCountBno(int bno) {
		log.info("bno값 가져오기");
		return repmapper.getCountBno(bno);
	}
	
	@Override
	public BoardRepVO read(int rno) {
		log.info("댓글 가져오기");
		return repmapper.read(rno);
	}
	
	@Transactional
	@Override
	public boolean del(int rno) {
		log.info("댓글 삭제하기");
		BoardRepVO repvo=repmapper.read(rno);
		mapper.updateReplyCnt(-1, repvo.getBno()); //댓글수 -1
		return repmapper.del(rno)==1?true:false;
	}
	
	@Override
	public boolean update(BoardRepVO vo) {
		log.info("댓글 수정하기");
		return repmapper.update(vo)==1?true:false;
	}
	
}
