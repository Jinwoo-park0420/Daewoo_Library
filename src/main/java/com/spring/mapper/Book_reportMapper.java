package com.spring.mapper;

import java.util.List;

import com.spring.domain.Book_reportVO;

public interface Book_reportMapper {

	public int book_reportinsert(Book_reportVO report);

	public List<Book_reportVO> book_reportList();

	public Book_reportVO book_reportSelectList(int bno);
}
