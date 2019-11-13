package com.spring.service;

import java.util.List;

import com.spring.domain.AttachFileVO;
import com.spring.domain.Book_reportVO;

public interface Book_reportService {

	public boolean book_reportinsert(Book_reportVO report);
	
	public List<Book_reportVO> book_reportList();

	public Book_reportVO book_reportSelectList(int bno);
	
	public boolean book_reportupdate(Book_reportVO report);
	
	public int book_reportdelete(Book_reportVO report);
	
	public List<AttachFileVO> getAttachList(int bno);
}
