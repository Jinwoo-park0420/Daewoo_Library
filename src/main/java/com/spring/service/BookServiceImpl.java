package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ApplyBookVO;
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
	public List<BookVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	
	@Override
	public List<BookVO> newbook() {
		// TODO Auto-generated method stub
		return mapper.newbook();
	}
	
	@Override
	public List<BookVO> recommandbook() {
		// TODO Auto-generated method stub
		return mapper.recommandbook();
	}
	
	@Override
	public List<BookVO> popularbook() {
		// TODO Auto-generated method stub
		return mapper.popularbook();
	}
	
	@Override
	public List<BookVO> loanbook() {
		// TODO Auto-generated method stub
		return mapper.loanbook();
	}
	
	@Override
	public List<BookVO> book_search(String criteria, String keyword) {
		// TODO Auto-generated method stub
		return mapper.book_search(criteria, keyword);
	}
	
	@Override
	public BookVO bookDetail(int bookno) {
		// TODO Auto-generated method stub
		return mapper.bookDetail(bookno);
	}

}
