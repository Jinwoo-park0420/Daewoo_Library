package com.spring.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.BookVO;
import com.spring.domain.Criteria;

public interface BookMapper {

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
	
	public int getTotalCount(Criteria cri);
	
	public int getNewCount(Criteria cri);

	public int getRecCount(Criteria cri);

	public int getPopCount(Criteria cri);
	
	public int getLoanCount(Criteria cri);
	
	//도서 상세보기
	public BookVO bookDetail(int bookno);
}
