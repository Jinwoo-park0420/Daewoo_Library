package com.spring.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int bno;
	private String title;
	private String writer;
	private String content;
	private String password;
	private Date regdate;
	private Date updatedate;
	private int readcnt; //게시물 조회수
	private int replycnt; //게시물 댓글수
}
