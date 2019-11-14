package com.spring.domain;

import java.util.List;

import lombok.Data;

@Data
public class Book_reportVO {
	private int bno;
	private String  title;
	private String writer;
	private String content;
	private String regdate;
	private String updatedate;
	private String password;
	private int apply; //등록확인 유무
	
	private List<AttachFileVO> attachList;
}
