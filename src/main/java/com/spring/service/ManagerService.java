package com.spring.service;

import java.util.List;


import com.spring.domain.ApplyBookVO;
import com.spring.domain.BookVO;
import com.spring.domain.Book_reportVO;
import com.spring.domain.MemberVO;

public interface ManagerService {
	public List<MemberVO> ManagerList();


	public MemberVO ManagerRead(MemberVO member);

	public int ManagerDelete(MemberVO member);
	
	public List<ApplyBookVO> ManagerApplyList();
	
	public ApplyBookVO apply(ApplyBookVO apply);
	
	public int book_insert(BookVO book);
	
	public int statusChange(ApplyBookVO apply);
	
	public int statusChange2(ApplyBookVO apply);
	public int applyChange(Book_reportVO report);
}
