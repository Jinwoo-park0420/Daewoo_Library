package com.spring.service;

import java.util.List;


import com.spring.domain.ApplyBookVO;
import com.spring.domain.BoardVO;
import com.spring.domain.BookCriteria;
import com.spring.domain.BookVO;

public interface BookService {

	//도서신청 
	public int ApplyBook(ApplyBookVO Apply);
		
	//도서 전체목록
	public List<BookVO> getList(BookCriteria cri);
	//신규 도서 목록
	public List<BookVO> newbook(BookCriteria cri);
	//추천 도서 목록
	public List<BookVO> recommandbook(BookCriteria cri);
	//인기 도서 목록
	public List<BookVO> popularbook(BookCriteria cri);
	//대출 급상승 도서 목록
	public List<BookVO> loanbook(BookCriteria cri);
	//도서 검색
	public List<BookVO> book_search(String criteria, String keyword);
	
	public int totalCnt(BookCriteria cri);

	public int NewCnt(BookCriteria cri);
	
	public int PopCnt(BookCriteria cri);
	
	public int RecCnt(BookCriteria cri);
	
	public int LoanCnt(BookCriteria cri);
	
	//도서 상세보기
	public BookVO bookDetail(int bookno);
	
	//도서 대여 페이지
	public BookVO bookRental(int bookno);
}
