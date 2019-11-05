package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

@Service("member")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	
	@Override

	public int memberJoin(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.memberJoin(vo);
	}


	@Override
	public LoginVO login(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}

}
