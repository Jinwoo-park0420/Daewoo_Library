package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Book_reportVO;
import com.spring.mapper.Book_reportMapper;

@Service("book_report")
public class Book_reportServiceImpl implements Book_reportService {

	@Autowired
	private Book_reportMapper mapper;

	@Override
	public int book_reportinsert(Book_reportVO report) {
		// TODO Auto-generated method stub
		
		return mapper.book_reportinsert(report);
	}

	@Override
	public List<Book_reportVO> book_reportList() {
		// TODO Auto-generated method stub
		return mapper.book_reportList();
	}

	@Override
	public Book_reportVO book_reportSelectList(int bno) {
		// TODO Auto-generated method stub
		return mapper.book_reportSelectList(bno);
	}

	@Override
	public int book_reportupdate(Book_reportVO report) {
		// TODO Auto-generated method stub
		return mapper.book_reportupdate(report);
	}

	@Override
	public int book_reportdelete(Book_reportVO report) {
		// TODO Auto-generated method stub
		return mapper.book_reportdelete(report);
	}

	
}
