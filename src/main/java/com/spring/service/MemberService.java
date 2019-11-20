package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberUpdateVO;
import com.spring.domain.MemberVO;


public interface MemberService {

	public int memberJoin(MemberVO vo); //회원가입
	
	public LoginVO login(LoginVO vo);//로그인
	
	public boolean idCheck(String userid); //아이디체크
	
	public MemberVO memberinfo(String userid); //회원정보보기
	
	public boolean memberupdate(MemberUpdateVO vo); //회원정보수정
	
	public boolean memberdelete(ChangeVO vo); //회원탈퇴
	
	public boolean pwdupdate(ChangeVO vo); //비밀번호 변경
	
	public BoardVO lendlist(BoardVO boardvo);
	
}
