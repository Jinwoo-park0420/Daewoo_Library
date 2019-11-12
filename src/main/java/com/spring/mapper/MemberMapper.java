package com.spring.mapper;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;

public interface MemberMapper {

	public int memberJoin(MemberVO vo);//회원가입
	
	public LoginVO login(LoginVO vo);//로그인
	
	public String idCheck(String userid); //아이디 체크
	
	public MemberVO memberinfo(String userid); //회원정보보기
	
	public int memberupdate(String userid); //회원정보수정
	
	public int memberdelete(ChangeVO vo); //회원탈퇴
	
	public int pwdupdate(ChangeVO vo); //비밀번호 변경
	
}
