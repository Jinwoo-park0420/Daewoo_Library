package com.spring.service;

import java.util.List;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.BoardVO;
import com.spring.domain.BookVO;

public interface BookService {

	//도서신청 
	public int ApplyBook(ApplyBookVO Apply);
		
	//도서 전체목록
	public List<BookVO> getList();
	//신규 도서 목록
	public List<BookVO> newbook();
	//추천 도서 목록
	public List<BookVO> recommandbook();
	//인기 도서 목록
	public List<BookVO> popularbook();
	//대출 급상승 도서 목록
	public List<BookVO> loanbook();
	//도서 검색
	public List<BookVO> book_search(String criteria, String keyword);
	//도서 상세보기
	public BookVO bookDetail(int bookno);
}
