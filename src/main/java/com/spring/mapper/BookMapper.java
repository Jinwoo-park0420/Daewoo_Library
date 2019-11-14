package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.BookCriteria;
import com.spring.domain.BookVO;

public interface BookMapper {

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
	public List<BookVO> book_search(@Param("criteria") String criteria, @Param("keyword") String keyword);
	
	public int getTotalCount(BookCriteria cri);
	
	public int getNewCount(BookCriteria cri);

	public int getRecCount(BookCriteria cri);

	public int getPopCount(BookCriteria cri);
	
	public int getLoanCount(BookCriteria cri);
	
	//도서 상세보기
	public BookVO bookDetail(int bookno);
}
