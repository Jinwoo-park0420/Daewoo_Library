package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberUpdateVO;
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
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		String password = bcrypt.encode(vo.getPassword());
		vo.setPassword(password);
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
	public boolean memberupdate(MemberUpdateVO vo) {
		
		return mapper.memberupdate(vo)==1?true:false;
	}


	@Override
	public boolean memberdelete(ChangeVO vo) {
		// TODO Auto-generated method stub
		return mapper.memberdelete(vo)==1?true:false;
	}


	@Override
	public boolean pwdupdate(ChangeVO vo) {
		// TODO Auto-generated method stub
		return mapper.pwdupdate(vo)==1?true:false;
	}
}
