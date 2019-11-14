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
		//vo => userid, password, grade
		
		
		//userid 값을 이용해서 비밀번호 받기
		//MemberVO member;
		//String userid = vo.getUserid();	
		
		//암호화 된 비밀번호 뽑아오기
		String password= mapper.loginpassword(vo.getUserid());
		//받아온 password 값을
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		boolean result=bcrypt.matches(vo.getPassword(), password);			
		
		if(result) {
			vo.setPassword(password);
			return mapper.login(vo);
		}
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
