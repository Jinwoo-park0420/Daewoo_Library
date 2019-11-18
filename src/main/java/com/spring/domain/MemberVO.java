package com.spring.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String name; // 유저이름
	private String userid; // 유저아이디
	private String password; // 유저비밀번호
	private String current_password;// 비밀번호 확인
	private String email; // 이메일
	private String address; // 집주소
	private String phone_number; // 핸드폰번호
	private String joindate; //회원가입한날
	private int grade; // 회원등급 초기값 0 관리자 1 DB에서 직접입력
	private int lease_status; // 대여상태 초기값 0 (0 미대여 1대여 2초과)
	private String birthYear ; // 생년월일
}