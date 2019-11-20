package com.spring.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.BookVO;
import com.spring.domain.Criteria;
import com.spring.mapper.BookMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("book")
public class BookServiceImpl implements BookService {

	@Inject
	private BookMapper mapper;
	
	
	@Override
	public int ApplyBook(ApplyBookVO Apply) {
		// TODO Auto-generated method stub
		return mapper.ApplyBook(Apply);
	}
	
	
	@Override
	public List<BookVO> getList(Criteria cri) {
		log.info("cri.getType "+cri.getType());
		return mapper.getList(cri);
	}
	
	@Override
	public List<BookVO> newbook(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.newbook(cri);
	}
	
	@Override
	public List<BookVO> recommandbook(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.recommandbook(cri);
	}
	
	@Override
	public List<BookVO> popularbook(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.popularbook(cri);
	}
	
	@Override
	public List<BookVO> loanbook(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.loanbook(cri);
	}
	
	@Override
	public List<BookVO> book_search(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.book_search(cri);
	}
	
	@Override
	public int totalCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public BookVO bookDetail(int bookno) {
		// TODO Auto-generated method stub
		return mapper.bookDetail(bookno);
	}
	
	@Override
	public BookVO bookRental(int bookno) {
		// TODO Auto-generated method stub
		return mapper.bookRental(bookno);
	}
	
	@Override
	public int rentalUpdate(BookVO vo) {
		// TODO Auto-generated method stub
		return mapper.rentalUpdate(vo);
	}
	
	@Override
	public int returnUpdate(BookVO vo) {
		// TODO Auto-generated method stub
		return mapper.returnUpdate(vo);
	}

	@Override
	public int NewCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getNewCount(cri);
	}

	@Override
	public int PopCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getPopCount(cri);
	}

	@Override
	public int RecCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getRecCount(cri);
	}

	@Override
	public int LoanCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getLoanCount(cri);
	}

}
