package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Book_reportVO;
import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberUpdateVO;
import com.spring.domain.MemberVO;

public interface MemberMapper {

	public int memberJoin(MemberVO vo);//회원가입
	
	public LoginVO login(LoginVO vo);//로그인
	
	public String idCheck(String userid); //아이디 체크
	
	public MemberVO memberinfo(String userid); //회원정보보기
	
	public int memberupdate(MemberUpdateVO vo); //회원정보수정
	
	public int memberdelete(ChangeVO vo); //회원탈퇴
	
	public int pwdupdate(ChangeVO vo); //비밀번호 변경
	
	public String loginpassword(String userid);
	
	public String changepassword(String userid);
	
	public List<Book_reportVO> reportinfo(Book_reportVO report);
	
	public List<BoardVO> boardinfo(BoardVO board);
}
