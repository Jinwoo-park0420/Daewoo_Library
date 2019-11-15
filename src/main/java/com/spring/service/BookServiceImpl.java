package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.BookCriteria;
import com.spring.domain.BookVO;
import com.spring.mapper.BookMapper;

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
	public List<BookVO> getList(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(cri);
	}
	
	@Override
	public List<BookVO> newbook(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.newbook(cri);
	}
	
	@Override
	public List<BookVO> recommandbook(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.recommandbook(cri);
	}
	
	@Override
	public List<BookVO> popularbook(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.popularbook(cri);
	}
	
	@Override
	public List<BookVO> loanbook(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.loanbook(cri);
	}
	
	@Override
	public List<BookVO> book_search(String criteria, String keyword) {
		// TODO Auto-generated method stub
		return mapper.book_search(criteria, keyword);
	}
	
	@Override
	public int totalCnt(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public BookVO bookDetail(int bookno) {
		// TODO Auto-generated method stub
		return mapper.bookDetail(bookno);
	}

	@Override
	public int NewCnt(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getNewCount(cri);
	}

	@Override
	public int PopCnt(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getPopCount(cri);
	}

	@Override
	public int RecCnt(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getRecCount(cri);
	}

	@Override
	public int LoanCnt(BookCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getLoanCount(cri);
	}

}
