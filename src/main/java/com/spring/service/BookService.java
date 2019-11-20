package com.spring.service;

import java.util.List;



import com.spring.domain.ApplyBookVO;
import com.spring.domain.BoardVO;
import com.spring.domain.BookVO;
import com.spring.domain.Criteria;

public interface BookService {

	//도서신청 
	public int ApplyBook(ApplyBookVO Apply);
		
	//도서 전체목록
	public List<BookVO> getList(Criteria cri);
	//신규 도서 목록
	public List<BookVO> newbook(Criteria cri);
	//추천 도서 목록
	public List<BookVO> recommandbook(Criteria cri);
	//인기 도서 목록
	public List<BookVO> popularbook(Criteria cri);
	//대출 급상승 도서 목록
	public List<BookVO> loanbook(Criteria cri);
	//도서 검색
	public List<BookVO> book_search(Criteria cri);
	
	public int totalCnt(Criteria cri);

	public int NewCnt(Criteria cri);
	
	public int PopCnt(Criteria cri);
	
	public int RecCnt(Criteria cri);
	
	public int LoanCnt(Criteria cri);
	
	//도서 상세보기
	public BookVO bookDetail(int bookno);
	
	//도서 대여 페이지
	public BookVO bookRental(int bookno);
	
	//대여
	public int rentalUpdate(BookVO vo);
	//반납
	public int returnUpdate(BookVO vo);
	
	public int returnstatusUpdate();
}
