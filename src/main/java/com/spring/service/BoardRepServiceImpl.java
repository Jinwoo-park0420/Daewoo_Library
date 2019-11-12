package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardRepVO;
import com.spring.mapper.BoardRepMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardRepServiceImpl implements BoardRepService {

	@Autowired
	private BoardRepMapper repmapper;

	@Override
	public List<BoardRepVO> readReply(int bno) {
		log.info("댓글불러오기!");
		return repmapper.readReply(bno);
	}

	@Override
	public void insertReply(BoardRepVO repvo) {
		log.info("댓글 작성하기");
		repmapper.insertReply(repvo);
	}
}
