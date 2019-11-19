package com.spring.service;

import java.util.List;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.MemberVO;

public interface ManagerService {
	public List<MemberVO> ManagerList();


	public MemberVO ManagerRead(MemberVO member);

	public int ManagerDelete(MemberVO member);
	
	public List<ApplyBookVO> ManagerApplyList();
}
