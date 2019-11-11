package com.spring.mapper;

import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;

public interface MemberMapper {

	public int memberJoin(MemberVO vo);//회원가입
	
	public LoginVO login(LoginVO vo);//로그인
	
	public String idCheck(String userid); //아이디 체크
	
	public MemberVO memberinfo(String userid); //회원정보보기
	
	public int memberupdate(MemberVO vo); //회원정보수정
}
