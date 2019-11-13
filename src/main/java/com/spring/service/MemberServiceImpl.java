package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Service("member")
@Slf4j
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
	
	@Override
	public boolean idCheck(String userid) {
		log.info("service id:"+userid);
		return mapper.idCheck(userid)==null?true:false;
	}


	@Override
	public MemberVO memberinfo(String userid) {
		// TODO Auto-generated method stub
		return mapper.memberinfo(userid);
	}


	@Override
	public boolean memberupdate(MemberVO vo) {
		
		return mapper.memberupdate(vo)==1?true:false;
	}
}
