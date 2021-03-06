package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.BookVO;
import com.spring.domain.Book_reportVO;
import com.spring.domain.MemberVO;
import com.spring.mapper.ManagerMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service("manager")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerMapper mapper;
	
	@Override
	public List<MemberVO> ManagerList() {
		// TODO Auto-generated method stub
		System.out.println("서비스 내의 syso!");
		return mapper.ManagerList();
	}

	@Override
	public MemberVO ManagerRead(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.ManagerRead(member);
	}

	@Override
	public int ManagerDelete(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.ManagerDelete(member);
	}

	@Override
	public List<ApplyBookVO> ManagerApplyList() {
		// TODO Auto-generated method stub
		return mapper.ManagerApplyList();
	}

	@Override
	public ApplyBookVO apply(ApplyBookVO apply) {
		// TODO Auto-generated method stub
		
		return mapper.apply(apply);
	}

	@Override
	public int book_insert(BookVO book) {
		// TODO Auto-generated method stub
		log.info("서비스내부"+book);
		
		
		  log.info("status체인ㄴ지"+book);
		 return mapper.book_insert(book);
	}

	@Override
	public int statusChange(ApplyBookVO apply) {
		// TODO Auto-generated method stub
		return mapper.statusChange(apply);
	}

	@Override
	public int applyChange(Book_reportVO report) {
		// TODO Auto-generated method stub
		return mapper.applyChange(report);
	}

	@Override
	public int statusChange2(ApplyBookVO apply) {
		// TODO Auto-generated method stub
		return mapper.statusChange2(apply);
	}

	@Override
	public List<BookVO> bookUserList() {
		// TODO Auto-generated method stub
		return mapper.bookUserList();
	}

}
