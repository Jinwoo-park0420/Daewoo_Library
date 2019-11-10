package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ApplyBookVO;
import com.spring.mapper.BookMapper;

@Service("book")
public class BookServiceImpl implements BookService {

	@Inject
	private BookMapper mapper;
	
	
	@Override
	public int ApplyBook(ApplyBookVO Apply) {
		// TODO Auto-generated method stub
		return mapper.ApplyBook(Apply);
	}

}
