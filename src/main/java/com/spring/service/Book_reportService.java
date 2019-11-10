package com.spring.service;

import java.util.List;

import com.spring.domain.Book_reportVO;

public interface Book_reportService {

	public int book_reportinsert(Book_reportVO report);
	
	public List<Book_reportVO> book_reportList();

}
