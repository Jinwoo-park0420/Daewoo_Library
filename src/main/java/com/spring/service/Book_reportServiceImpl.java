package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.AttachFileVO;
import com.spring.domain.Book_reportVO;
import com.spring.mapper.Book_AttachMapper;
import com.spring.mapper.Book_reportMapper;

@Service("book_report")
public class Book_reportServiceImpl implements Book_reportService {

	@Autowired
	private Book_reportMapper mapper;
	
	@Autowired
	private Book_AttachMapper attach;

	@Transactional
	@Override
	public boolean book_reportinsert(Book_reportVO report) {
		// TODO Auto-generated method stub
		
		boolean result = mapper.book_reportinsert(report)==1?true:false;
		System.out.println("서비스내부에서의" +report);
		
		/*
		 * if(report.getAttachList()==null||report.getAttachList().size()<=0) { return
		 * false; }
		 */
		System.out.println("getBno++"+report.getBno());
		
		for(AttachFileVO attachVO:report.getAttachList()) {
			attachVO.setBno(report.getBno());
			attach.attach_insert(attachVO);
		}
	
		return result;
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
	public boolean book_reportupdate(Book_reportVO report) {
		// TODO Auto-generated method stub
		System.out.println("serviceimpl 내의 "+report);
		attach.attach_delete(report.getBno());
		if(report.getAttachList()==null||report.getAttachList().size()<=0) {
			return false;
		}
		System.out.println("serviceimpl 내의 서비스 실행 후에 "+report);
		
		boolean modifyResult = mapper.book_reportupdate(report)==1;
		if(modifyResult&&report.getAttachList().size()>0) {
			for(AttachFileVO attachVO:report.getAttachList()) {
				attachVO.setBno(report.getBno());
				attach.attach_insert(attachVO);
			}
		}
			
		return modifyResult;
	}

	@Override
	public int book_reportdelete(Book_reportVO report) {
		// TODO Auto-generated method stub
		attach.attach_delete(report.getBno());
		return mapper.book_reportdelete(report);
	}

	@Override
	public List<AttachFileVO> getAttachList(int bno) {
		// TODO Auto-generated method stub
		return attach.getAttachList(bno);
	}

	
}
