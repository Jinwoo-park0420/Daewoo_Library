package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.domain.Book_reportVO;
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
		//현재 db에 있는 암호화 된 비밀번호 추출
		String password= mapper.changepassword(vo.getUserid());
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		//사용자가 입력한 현재 비밀번호가 암호화된 비밀번호와 일치한지 확인
		boolean result=bcrypt.matches(vo.getCurrent_password(), password);
	
		if(result) {
			//바꿀 비밀번호 암호화
			vo.setConfirm_password(bcrypt.encode(vo.getConfirm_password()));
		}
		return mapper.pwdupdate(vo)==1?true:false;
	}


	@Override
	public List<Book_reportVO> reportinfo(Book_reportVO report) {
		// TODO Auto-generated method stub
		return mapper.reportinfo(report);
	}


	@Override
	public List<BoardVO> boardinfo(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.boardinfo(board);
	}
	
	
}
