package com.spring.service;

import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;


public interface MemberService {

	public int memberJoin(MemberVO vo); //회원가입
	
	public LoginVO login(LoginVO vo);//로그인
	
	public boolean idCheck(String userid); //아이디체크
	
	public MemberVO memberinfo(String userid); //회원정보보기
	
	public boolean memberupdate(MemberVO vo); //회원정보수정
	
}
