package com.spring.mapper;

import java.util.List;

import com.spring.domain.ApplyBookVO;
import com.spring.domain.MemberVO;

public interface ManagerMapper {

	public List<MemberVO> ManagerList();
	
	public MemberVO ManagerRead(MemberVO member);
	
	public int ManagerDelete(MemberVO member);
	
	public List<ApplyBookVO> ManagerApplyList();
}
