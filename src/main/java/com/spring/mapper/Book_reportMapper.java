package com.spring.mapper;

import java.util.List;

import com.spring.domain.Book_reportVO;
import com.spring.domain.Criteria;

public interface Book_reportMapper {

	public int book_reportinsert(Book_reportVO report);

	public List<Book_reportVO> book_reportList(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public Book_reportVO book_reportSelectList(int bno);
	
	public int book_reportupdate(Book_reportVO report);
	
	public int book_reportdelete(Book_reportVO report);
	
}
